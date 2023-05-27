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

  final _changePassFormKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

  Future<void> updateUserPassword(String password) async {
    final userData = await _userRef
        .collection('Users')
        .where('email', isEqualTo: email)
        .get();

    if (userData.docs.isNotEmpty) {
      final userSnapshot =
          userData.docs.firstWhere((doc) => doc['email'] == email);

      // Update the specific field here
      await userSnapshot.reference.update({'password': password});
    }
  }

  String? checkPassword(String? pass) {
    if (pass == null || pass.isEmpty) {
      return "password field must not be empty";
    }
    if (pass.length < 8 || pass.length > 16) {
      return "password must between 8 and 16 character";
    }
    if (!pass.contains(RegExp(r"[a-z]"))) {
      return "password must contain at least one lower-case letter";
    }
    if (!pass.contains(RegExp(r"[A-Z]"))) {
      return "password must contain at least one upper-case letter";
    }
    if (!pass.contains(RegExp(r"[0-9]"))) {
      return "password must contain at least one number";
    }
    if (!pass.contains(RegExp(r'[!@#$%&*?]'))) {
      return "password must contain at least one of these special characters (!@#%^&*?)";
    } else {
      return null;
    }
  }

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
              Text(
                "And we will take care of the rest",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: width * 0.8,
                child: TextFormField(
                  controller: passController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "New password"),
                  validator: checkPassword,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: width * 0.8,
                child: TextFormField(
                  controller: passConfirmController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "confirm New password"),
                ),
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
                      if (pass != passConfirm) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("passwords doesn't match"),
                          duration: Duration(seconds: 2),
                        ));
                      } else {
                        updateUserPassword(pass);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("passwords has been updated sucessfully"),
                          duration: Duration(seconds: 2),
                        ));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }
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
