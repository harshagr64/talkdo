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
                  Container(
                    margin: Edge,
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEFF9),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Color(0xFF040303),
                      ),
                      onPressed: () {},
                    ),
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
