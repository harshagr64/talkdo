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
        backgroundColor: Color(0xFF415a77),
        body: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          // Color(0xFF370551).withOpacity(0.3),
                          Color(0xFF3716D1).withOpacity(0.3),
                          Color(0xFF29128A).withOpacity(0.8),
                          // Color(0xFF120965).withOpacity(0.8), 
                        ],
                        
                      )
                    ),
                  )
        ),);
  }
}
