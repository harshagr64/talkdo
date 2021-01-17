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
                      Text(
                        'Welcome to Talkdo',
                        style: myStyle(size),
                      ),
                      Text(
                        'All your messages in one place',
                        style: myStyle(
                          20,
                          Color(0xFFFAF9FC).withOpacity(0.8),
                          FontWeight.w700,
                          3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
