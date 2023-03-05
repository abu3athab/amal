import 'package:flutter/material.dart';
import 'signUpTextBoxes.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpChild();
  }
}

class SignUpChild extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "/Users/abu_3athab/Desktop/development/amal/lib/assets/signUpImage.jpg"),
                  fit: BoxFit.cover),
            ),
            // padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Container(
                  child: new SignUpTextBox(),
                  padding: EdgeInsets.all(30),
                )
              ],
            )));
  }
}
