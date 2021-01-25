import "package:flutter/material.dart";
import "variables/variable.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:image_picker/image_picker.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "dart:io";

class Profile extends StatefulWidget {
  static const routeName = 'profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _image;
  TextEditingController _name = TextEditingController();
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = ModalRoute.of(context).settings.arguments;
    AuthCredential credential = data[0];
    String phone = data[1];

    _profileImage() async {
      final pickedImage =
          await ImagePicker.platform.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        String ext = pickedImage.path.split('.').last;
        if (ext == 'jpg' || ext == 'jpeg' || ext == "png") {
          setState(
            () {
              _image = pickedImage.path;
            },
          );
        } else {}
      } else {}
    }

    _createUser() async {
      setState(() {
        _isValid = false;
      });
      if (_name.text.trim().length == 0) {
        setState(() {
          _isValid = true;
        });
        return;
      }

      final userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);

      User user = userCred.user;
      await FirebaseFirestore.instance.collection('users').doc('phone').update({
        '$phone': '1',
      });

      // Profile Image Upload

      final profile = FirebaseStorage.instance.ref().child('profilepics');

      UploadTask _upload = profile.child(user.uid).putFile(
          _image == null ? File('assets/images/im2.png') : File(_image));
await _upload.snapshot
      final url = await _upload.snapshot.ref.getDownloadURL();
      print(url);

      // await FirebaseFirestore.instance
      //     .collection('newusers')
      //     .doc(user.uid)
      //     .set({
      //   'phone': phone,
      //   'name': _name.text.trim(),
      //   'uid': user.uid,
      //   'date': DateTime.now().toString(),
      //   'time': Timestamp.now().toString(),
      // });

      // await FirebaseFirestore.instance.collection('newusers');
    }

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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => _profileImage(),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.24,
                      ),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              // backgroundColor: Color(0xFFC9A7FC).withOpacity(1),
                              backgroundColor: Colors.white,
                              radius: 12,
                              child: Icon(
                                Icons.camera_alt,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          radius: 50.0,
                          backgroundImage: (_image == null)
                              ? AssetImage('assets/images/im2.png')
                              : AssetImage(
                                  _image,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                        width: double.infinity,
                        child: TextField(
                          controller: _name,
                          style: myStyle(18, Color(0xFF040303)),
                          maxLength: 20,
                          decoration: InputDecoration(
                            fillColor: Color(0xFFC9A7FC).withOpacity(0.1),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            hintText: 'Enter Name',
                            counterText: "",
                            hintStyle: myStyle(15),
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                          ),
                          cursorColor: Color(0xFF040303),
                        ),
                      ),
                      if (_isValid)
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Text(
                                '* Please Enter a Name',
                                style: myStyle(
                                    14, Colors.redAccent.withOpacity(0.8)),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => _createUser(),
                        child: Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          alignment: Alignment.center,
                          height: 60,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            color: Color(0xFF5F26C7).withOpacity(1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'Done',
                            textAlign: TextAlign.center,
                            style: myStyle(
                              20,
                              Color(0xFFFAF9FC).withOpacity(0.8),
                              FontWeight.w500,
                              2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
