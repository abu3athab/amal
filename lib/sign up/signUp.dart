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
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/signUpImage.jpg"), fit: BoxFit.cover),
      ),
      padding: const EdgeInsets.all(17.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Account",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SignUpTextBox(),
        ],
      ),
    ));
  }
}
