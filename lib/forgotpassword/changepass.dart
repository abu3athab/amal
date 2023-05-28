import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../log in/logIn.dart';
import 'forgotpassver.dart';

class ChangePass extends StatelessWidget {
  String email;
  ChangePass({required this.email});
  var _userRef = FirebaseFirestore.instance;
  bool exist = false;

  final _changePassFormKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Form(
          key: _changePassFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                height: height * 0.1,
              ),
              Text(
                "Yay Success!!",
                style: TextStyle(fontSize: 27, color: Colors.black),
              ),
              Container(
                child: Image.asset(
                  "assets/happygirlpassword.jpeg",
                  height: height * 0.30,
                ),
              ),
              Text(
                "Enter your new password",
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Container(
                width: width * 0.6,
                height: height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    if (_changePassFormKey.currentState!.validate()) {
                      String pass = passController.text;
                      String passConfirm = passConfirmController.text;

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("passwords has been updated sucessfully"),
                        duration: Duration(seconds: 2),
                      ));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    }
                  },
                  child: Text(
                    "Change",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                      backgroundColor: MaterialStateProperty.all(logoColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
