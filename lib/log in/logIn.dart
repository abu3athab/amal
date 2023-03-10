import 'dart:ui';

import 'package:demo2/colors.dart';
import 'package:demo2/log%20in/logInTextBoxes.dart';
import 'package:demo2/log%20in/loginEmail.dart';
import 'package:demo2/log%20in/loginPassword.dart';
import 'package:demo2/log%20in/rememberMe.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginChild();
  }
}

class LoginChild extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 0.35 * height,
                  width: width * 0.65,
                  child: Image.asset("assets/amalLogo.png")),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              LogInEmail(),
              SizedBox(
                height: height * 0.0001,
              ),
              LogInPassword(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 0, horizontal: width * 0.02),
                      child: RememberMe()),
                  TextButton(
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.green,
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: () => null,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                width: width * 0.6,
                height: height * 0.05,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(logoColor)),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: (() => null),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: logoColor),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
