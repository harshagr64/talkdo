import 'package:flutter/material.dart';
import 'package:talkdo/home.dart';
import "sign_in.dart";
import "sign_up.dart";
import "package:firebase_core/firebase_core.dart";

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talkdo',
      home: Home(),
      routes: {
        SignUp.routeName: (ctx) => SignUp(),
      },
    );
  }
}
