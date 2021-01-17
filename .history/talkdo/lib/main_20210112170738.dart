import 'package:flutter/material.dart';
import "variables/variable.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talkdo',
      home: SignUp(),
    );
  }
}

class SignUp extends StatelessWidget {
  Widget buttonBuilder(String text, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: myStyle(
          20,
          Color(0xFFFAF9FC).withOpacity(0.8),
          FontWeight.w500,
          2,
        ),
      ),
    );
  }

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
                      buttonBuilder('Sign Up', context),
                      SizedBox(
                        height: 20,
                      ),
                      buttonBuilder('Sign In', context),
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
