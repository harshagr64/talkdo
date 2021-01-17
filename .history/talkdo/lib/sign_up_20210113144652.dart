import "package:flutter/material.dart";

class SignUp extends StatelessWidget {
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        shadowColor: Color(0xFFFAFAFA),
        elevation: 0,
        leading: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Color(0xFFF0F4F5),
        
            borderRadius: BorderRadius.circular(40),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF040303),
            ),
            onPressed: () {},
          ),
        ),
      ),
      backgroundColor: Color(0xFFFAFAFA),
      body: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}