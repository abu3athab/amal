import 'package:demo2/colors.dart';
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
      appBar: AppBar(
        title: Text("User SignUp"),
        backgroundColor: logoColor,
      ),
      body: SignUpForUser(),
      // ],
    );
  }
}
