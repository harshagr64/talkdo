import 'package:flutter/material.dart';

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
        backgroundColor: Color(0xFF233d4d),
        body: Center(
                  child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            color: Color(0xFF619B8A),
          ),
        ),);
  }
}
