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

  TextEditingController _phone = TextEditingController();

  TextEditingController _c1 = TextEditingController();
  TextEditingController _c2 = TextEditingController();
  TextEditingController _c3 = TextEditingController();
  TextEditingController _c4 = TextEditingController();

  Future<bool> _signUpUser(String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credentials) async {
          UserCredential result = await _auth.signInWithCredential(credentials);

          User user = result.user;

          if (user != null) {
            print(user);
          } else {
            print('error');
          }
        },
        timeout: Duration(seconds: 60),
        verificationFailed: (FirebaseAuthException exception) {
          print("Error Occured");
        },
        codeSent: (String vId, [int token]) {
final code = _c1.text;
PhoneAuthProvider.
        },
        codeAutoRetrievalTimeout: (String vid) {
          print(vid);
        });
  }

  steps() {
    setState(() {
      isValid = false;
    });

    if (step == 1) {
      if (_phone.text.length < 10 ||
          !RegExp(r'^[0-9]+$').hasMatch(_phone.text)) {
        setState(() {
          isValid = true;
        });
        return;
      }
      String phone = '+91${_phone.text}';
      print(phone);
      _signUpUser(phone);

      setState(
        () {
          step = 2;
        },
      );
    } else if (step == 2) {
      setState(
        () {
          step = 3;
        },
      );
    }
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
        _otpText(false, true),
      ],
    );
  }

  Widget _otpText(bool first, bool last) {
    return Container(
      width: 50,
      height: 50,
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
