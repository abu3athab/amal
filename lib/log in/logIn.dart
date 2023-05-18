import 'package:demo2/Main%20page/mainPageNavigator.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/forgotpassword/forgotpass.dart';

import 'package:demo2/log%20in/loginEmail.dart';
import 'package:demo2/log%20in/loginPassword.dart';
import 'package:demo2/log%20in/rememberMe.dart';
import 'package:demo2/sign%20up/chooseType.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginChild();
  }
}

class LoginChild extends State<Login> {
  String _email = LogInEmail().getUserEmail();
  String _password = LogInPasswordChild().getUserPassword();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 0.35 * height,
                  width: width * 0.5,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.cover,
                    width: width * 0.80,
                    height: height * 50,
                  )),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: height * 0.02,
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
                          vertical: 0, horizontal: width * 0.04),
                      child: RememberMe()),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                    child: TextButton(
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: logoColor,
                            decoration: TextDecoration.underline),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPass()),
                        );
                      },
                    ),
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
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text(_email),
                    ));
                    // final user = await FirebaseAuth.instance
                    //     .signInWithEmailAndPassword(
                    //         email: _email, password: _password);

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => MainPageNavigator()),
                    // );

                    // if (user != null) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MainPageNavigator()),
                    //   );
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //     duration: Duration(seconds: 2),
                    //     content: Text("user doesn't exist"),
                    //   ));

                    //   } catch (e) {
                    //     _email = "";
                    //     _password = "";
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       duration: Duration(seconds: 2),
                    //       content: Text("user doesn't "),
                    //     ));
                    //   }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
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
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Choose()),
                        );
                      },
                      child: const Text(
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
