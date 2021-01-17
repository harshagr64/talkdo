import "package:flutter/material.dart";
import 'package:talkdo/variables/variable.dart';

class SignUp extends StatelessWidget {
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF29128A),
      // backgroundColor: Color(0xFF415a77),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF29128A).withOpacity(0.7),
              Color(0xFF120965).withOpacity(0.8),
              Color(0xFF3716D1).withOpacity(0.8),

              // Color(0xFF29128A).withOpacity(0.8),
            ],
          ),
        ),
        height: double.infinity,
        child: SingleChildScrollView(
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
                                color: Color(0xFF29128A).withOpacity(0.07),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_sharp,
                                size: 20,
                                color: Color(0xFFFAF9FC).withOpacity(0.7),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
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
                          Color(0xFFFAF9FC).withOpacity(0.8),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '(1/3)',
                        style: myStyle(
                          16,
                          Color(0xFFFAF9FC).withOpacity(0.8),
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
                            Color(0xFFFAF9FC).withOpacity(0.8),
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
                        Text(
                          "Enter your phone number to continue ",
                          style: myStyle(
                            16,
                            Color(0xFFFAF9FC).withOpacity(0.8),
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
                        fillColor: Color(0xFFFAF9FC).withOpacity(1),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF29128A).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
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
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                  color: Color(0xFFFAF9FC).withOpacity(0.9),
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                        ],
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
