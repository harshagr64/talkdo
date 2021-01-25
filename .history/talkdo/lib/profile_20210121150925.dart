import "package:flutter/material.dart";
import "variables/variable.dart";

class Profile extends StatelessWidget {
  static const routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    List<Object> data = ModalRoute.of(context).settings.arguments;
    final credential = data[0];
    final phone = data[1];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xFFC9A7FC).withOpacity(0.2),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 30,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Text(
              "Talkdo",
              textAlign: TextAlign.center,
              style: myStyle(
                25,
                Color(0xFF040303),
                FontWeight.w700,
                1,
                0.5,
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30.0),
              ),
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.24,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 12,
                        child: Icon(
                          Icons.camera_alt,
                          size: 15,
                        ),
                      ),
                    ),
                    radius: 48,
                   
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       margin: EdgeInsets.only(
      //         left: 10,
      //       ),
      //       child: Row(
      //         children: [
      //           Text(
      //             "Welcome to Talkdo!",
      //             style: myStyle(
      //               18,
      //               Color(0xFF040303),
      //               FontWeight.w700,
      //               1,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     CircleAvatar(
      //       radius: 50.0,
      //       backgroundColor: Color(0xFF5F26C7).withOpacity(0.8),
      //       child: CircleAvatar(
      //         child: Align(
      //           alignment: Alignment.bottomRight,
      //           child: CircleAvatar(
      //             backgroundColor: Color(0xFFFAFAFA),
      //             radius: 12,
      //             child: Icon(
      //               Icons.camera_alt,
      //               size: 15,
      //               color: Color(0xFF404040),
      //             ),
      //           ),
      //         ),
      //         radius: 48,
      //         backgroundImage: AssetImage(
      //           'assets/images/im2.png',
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 15),
      //     Container(
      //       height: 60,
      //       margin: EdgeInsets.only(left: 10, right: 10),
      //       width: double.infinity,
      //       child: TextField(
      //         style: myStyle(18, Color(0xFF040303)),
      //         maxLength: 20,
      //         decoration: InputDecoration(
      //           fillColor: Color(0xFFC9A7FC).withOpacity(0.1),
      //           filled: true,
      //           focusedBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(30),
      //               borderSide: BorderSide.none),
      //           hintText: 'Enter Name',
      //           counterText: "",
      //           hintStyle: myStyle(15),
      //           contentPadding: EdgeInsets.all(20),
      //           border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(30),
      //               borderSide: BorderSide.none),
      //         ),
      //         cursorColor: Color(0xFF040303),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
