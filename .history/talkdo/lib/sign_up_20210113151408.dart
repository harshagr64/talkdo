import "package:flutter/material.dart";
import 'package:talkdo/variables/variable.dart';

class SignUp extends StatelessWidget {
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Container(
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
                            color: Color(0xFFEBEFF9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_sharp,
                            size: 20,
                            color: Color(0xFF040303),
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
                    'Verification',
                    style: myStyle(
                      20,
                      Color(0xFF040303),
                    ),
                  ),
                  Text(
                    
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
