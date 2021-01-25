import "package:flutter/material.dart";
import 'package:talkdo/variables/variable.dart';
import "package:firebase_auth/firebase_auth.dart";

class SignUp extends StatefulWidget {
  static const routeName = 'signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var step = 1;
  int first;
  int sec;
  int third;
  int fourth;
  int no = 1;
  bool isValid = false;
  bool isValid1 = false;
  String phoneNo;
  String smsId;
  String verificationId;

  TextEditingController _phone = TextEditingController();

  TextEditingController _c1 = TextEditingController();
  TextEditingController _c2 = TextEditingController();
  TextEditingController _c3 = TextEditingController();
  TextEditingController _c4 = TextEditingController();
  TextEditingController _c5 = TextEditingController();
  TextEditingController _c6 = TextEditingController();

  steps() {
    setState(() {
      isValid = false;
      isValid1 = false;
    });

    if (step == 1) {
      if (_phone.text.length < 10 ||
          !RegExp(r'^[0-9]+$').hasMatch(_phone.text)) {
        setState(() {
          isValid = true;
        });
        return;
      }

      phoneNo = '+91${_phone.text}';
      print(phoneNo);
      verifyPhone();

      setState(
        () {
          step = 2;
        },
      );
    } else if (step == 2) {
      if (_c1.text.length == 0 ||
          _c2.text.length == 0 ||
          _c3.text.length == 0 ||
          _c4.text.length == 0 ||
          _c5.text.length == 0 ||
          _c6.text.length == 0 ||
          !RegExp(r'^[0-9]+$').hasMatch(_c1.text) ||
          !RegExp(r'^[0-9]+$').hasMatch(_c2.text) ||
          !RegExp(r'^[0-9]+$').hasMatch(_c3.text) ||
          !RegExp(r'^[0-9]+$').hasMatch(_c4.text) ||
          !RegExp(r'^[0-9]+$').hasMatch(_c5.text) ||
          !RegExp(r'^[0-9]+$').hasMatch(_c6.text)) {
        setState(() {
          isValid1 = true;
        });
        return;
      }
      String otp = '${_c1.text}${_c2.text}${_c1.text}';

      FirebaseAuth.instance.currentUser().then((user) {
        if (user != null) {
          print(user);
        } else {
          print('hello');
          // Navigator.of(context).pop();
          // signIn(smsId);
        }
      });
      setState(
        () {
          step = 3;
        },
      );
    }
  }

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId; 
    };
    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth) {
      print(' Auto verified ');
    };
    final PhoneVerificationFailed verifyFailed = (AuthException e) {
      print('error occured ${e.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 0),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
  }

 

  Future<void> signIn(String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      Navigator.of(context).pushReplacementNamed('/signup');
    }).catchError((e) {
      print(e);
    });
  }

  Future<bool> backStep() async {
    if (step == 1) {
      Navigator.of(context).pop();
    } else if (step == 2) {
      setState(
        () {
          step = 1;
        },
      );
    } else if (step == 3) {
      setState(
        () {
          step = 2;
        },
      );
    }
    return false;
  }

  Widget otpWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _otpText(true, false),
        _otpText(false, false),
        _otpText(false, false),
        _otpText(false, false),
        _otpText(false, false),
        _otpText(false, true),
      ],
    );
  }

  Widget _otpText(bool first, bool last) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFC9A7FC).withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        showCursor: false,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        maxLength: 1,
        maxLengthEnforced: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          counterText: "",
        ),
      ),
    );
  }

  Widget profilewidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundColor: Color(0xFF5F26C7).withOpacity(0.8),
          child: CircleAvatar(
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Color(0xFFFAFAFA),
                radius: 12,
                child: Icon(
                  Icons.camera_alt,
                  size: 15,
                  color: Color(0xFF404040),
                ),
              ),
            ),
            radius: 48,
            backgroundImage: AssetImage(
              'assets/images/im2.png',
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 60,
          margin: EdgeInsets.only(left: 10, right: 10),
          width: double.infinity,
          child: TextField(
            style: myStyle(18, Color(0xFF040303)),
            decoration: InputDecoration(
              fillColor: Color(0xFFC9A7FC).withOpacity(0.1),
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              hintText: 'Enter Name',
              hintStyle: myStyle(15),
              contentPadding: EdgeInsets.all(20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
            ),
            cursorColor: Color(0xFF040303),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: backStep,
      child: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            alignment: Alignment.center,
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFFC9A7FC).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_sharp,
                                size: 20,
                                color: Color(0xFF040303),
                              ),
                              onPressed: backStep,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'Verification Step',
                        style: myStyle(
                          22,
                          Color(0xFF040303),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (step == 1)
                        Text(
                          '(1/3)',
                          style: myStyle(
                            16,
                            Color(0xFF040303).withOpacity(0.5),
                          ),
                        ),
                      if (step == 2)
                        Text(
                          '(2/3)',
                          style: myStyle(
                            16,
                            Color(0xFF040303).withOpacity(0.5),
                          ),
                        ),
                      if (step == 3)
                        Text(
                          '(3/3)',
                          style: myStyle(
                            16,
                            Color(0xFF040303).withOpacity(0.5),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if (step == 1 || step == 2)
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Welcome to Talkdo!",
                            style: myStyle(
                              18,
                              Color(0xFF040303),
                              FontWeight.w700,
                              1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        if (step == 1)
                          Text(
                            "Enter your phone number to continue ",
                            style: myStyle(
                              16,
                              Color(0xFF040303).withOpacity(0.5),
                              FontWeight.w500,
                              2,
                            ),
                          ),
                        if (step == 2)
                          Text(
                            "Please, Enter the OTP sent to your phone number",
                            style: myStyle(
                              16,
                              Color(0xFF040303).withOpacity(0.5),
                              FontWeight.w500,
                              2,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (step == 1 || step == 2)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                  if (step == 1)
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: double.infinity,
                      child: TextField(
                        // controller: _email,
                        cursorColor: Color(0xFF040303),
                        keyboardType: TextInputType.number,
                        style: myStyle(
                          18,
                          Color(0xFF040303),
                        ),
                        maxLength: 10,
                        controller: _phone,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFC9A7FC).withOpacity(0.1),
                          filled: true,
                          counterText: "",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: 'Phone Number',
                          hintStyle: myStyle(16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  if (isValid)
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            '* Please enter a valid Phone No.',
                            style: myStyle(14, Colors.redAccent.withOpacity(1),
                                FontWeight.w700, 1, 0.5),
                          ),
                        ),
                      ],
                    ),
                  if (step == 2) otpWidget(),
                  if (isValid1)
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            '* Please enter a valid OTP',
                            style: myStyle(14, Colors.redAccent.withOpacity(1),
                                FontWeight.w700, 1, 0.5),
                          ),
                        ),
                      ],
                    ),
                  if (step == 3) profilewidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  InkWell(
                    onTap: steps,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFF5F26C7).withOpacity(1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (step == 1)
                              Text(
                                'Next',
                                style: myStyle(
                                    18,
                                    Color(0xFFFAF9FC).withOpacity(0.9),
                                    FontWeight.w500,
                                    0,
                                    1),
                              ),
                            if (step == 2)
                              Text(
                                'Submit',
                                style: myStyle(
                                    18,
                                    Color(0xFFFAF9FC).withOpacity(0.9),
                                    FontWeight.w500,
                                    0,
                                    1),
                              ),
                            if (step == 3)
                              Text(
                                'Submit',
                                style: myStyle(
                                    18,
                                    Color(0xFFFAF9FC).withOpacity(0.9),
                                    FontWeight.w500,
                                    0,
                                    1),
                              ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC9A7FC).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 20,
                                    color: Color(0xFFFAF9FC).withOpacity(0.8),
                                  ),
                                  onPressed: steps,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
