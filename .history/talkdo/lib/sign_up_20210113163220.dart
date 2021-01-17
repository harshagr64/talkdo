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
                            color: Color(0xFF040303).withOpacity(0.1),
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
                    'Verification Step',
                    style: myStyle(
                      22,
                      Color(0xFF040303),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '(1/3)',
                    style: myStyle(
                      16,
                      Color(0xFF040303).withOpacity(0.5),
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
                        Color(0xFF040303),
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
                        15,
                        Color(0xFF040303).withOpacity(0.5),
                        FontWeight.w500,
                        2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
               
              Container(
                    height: 55,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    child: TextField(
                      // controller: _email,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        hintText: 'Email',
                        hintStyle: myStyle(15),
                        prefixIcon:
                            Icon(Icons.email_outlined, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

            ],
          ),
        ),
      ),
    );
  }
}
