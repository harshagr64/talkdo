import 'dart:math';

import 'package:flutter/material.dart';
import "variables/variable.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talkdo',
      home: SignUp(),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF415a77),
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF3716D1).withOpacity(0.5),
                    Color(0xFF29128A).withOpacity(0.7),
                    Color(0xFF120965).withOpacity(0.7),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
                      ),
                      Text(
                        'Welcome to Talkdo',
                        style: myStyle(
                          20,
                          Color(0xFFFAF9FC).withOpacity(0.8),
                          FontWeight.w700,
                          3,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'All your messages in one place',
                        style: myStyle(
                          18,
                          Color(0xFFFAF9FC).withOpacity(0.7),
                          FontWeight.w400,
                          3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          color: Color(0xFF120965),
                          // border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.2),
                             
                              spreadRadius: 5,
                              offset: Offset(, 5),
                            )
                          ],
                        ),
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: myStyle(18, Color(0xFFFAF9FC).withOpacity(0.7),
                              FontWeight.w500, 2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
