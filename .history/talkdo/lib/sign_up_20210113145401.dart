import "package:flutter/material.dart";

class SignUp extends StatelessWidget {
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Color(0xFFFAFAFA),
      body: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: [
              Row(children: [
                IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xFF040303),
            ),
            onPressed: () {},
          ),

              ],)
            ],
          ),
        ),
      ),
    );
  }
}
