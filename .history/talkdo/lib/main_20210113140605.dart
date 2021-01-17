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


