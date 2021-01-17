import "package:flutter/material.dart";
import 'package:talkdo/variables/variable.dart';

class SignUp extends StatefulWidget {
  static const routeName = 'signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var step = 1;

  steps() {
    if (step == 1) {
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

  backStep() {
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
  }

  Widget otpWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _otpText(),
        _otpText(),
        _otpText(),
        _otpText(),
      ],
    );
  }

  Widget _otpText() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFC9A7FC).withOpacity(0.1),
        borderRadius: BorderRad
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                      decoration: InputDecoration(
                        fillColor: Color(0xFFC9A7FC).withOpacity(0.1),
                        filled: true,
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
                if (step == 2) otpWidget(),
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
                          Text(
                            'Next',
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
    );
  }
}
