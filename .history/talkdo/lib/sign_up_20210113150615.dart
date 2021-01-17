import "package:flutter/material.dart";

class SignUp extends StatelessWidget {
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: [
              Row(
                
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
