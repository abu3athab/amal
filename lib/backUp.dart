import 'package:flutter/material.dart';
import 'rememberMe.dart';
import 'logInTextBoxes.dart';
import 'package:demo2/sign up/signUp.dart';

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return App();
  }
}

//ddd
class App extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            constraints: BoxConstraints.expand(),
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/amalLogo.png"),
                const Text(
                  "login",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                new LogInTextBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new RememberMe(),
                    const TextButton(
                        onPressed: null,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 24, 102, 26),
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 210,
                  child: SizedBox(
                    height: 45,
                    width: 255,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Color.fromARGB(154, 0, 0, 0)),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 72, 201, 22)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 24, 102, 26),
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ))));
  }
}
