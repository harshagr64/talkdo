import "package:flutter/material.dart";

import "variables/variable.dart";
import 'sign_up.dart';

class Home extends StatelessWidget {
  Widget buttonBuilder(String text, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 55,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Colors.black26,
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
          Color(0xFFFAF9FC).withOpacity(0.7),
          FontWeight.w500,
          2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF415a77),
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF3716D1).withOpacity(0.93),
                    Color(0xFF120965).withOpacity(0.8),
                    // Color(0xFF29128A).withOpacity(0.8),
                  ],
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.all(10),

              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/images/home4.png',
                  fit: BoxFit.cover,
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
                        height: MediaQuery.of(context).size.height * 0.5,
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
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed(SignUp.routeName),
                        child: buttonBuilder('Get Started', context),
                      ),
                      SizedBox(
                        height: 20,
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
