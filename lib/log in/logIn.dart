// import 'package:flutter/material.dart';
// import 'rememberMe.dart';
// import 'logInTextBoxes.dart';
// import 'package:demo2/sign up/signUp.dart';

// class MainApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return App();
//   }
// }

// //ddd
// class App extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Login"),
//           backgroundColor: Colors.green,
//         ),
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             Container(height: 300, child: Image.asset("assets/amalLogo.png")),
//             LogInTextBox()
//           ],
//         ));
//   }
// }
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            height: height,
            width: width,
            margin: EdgeInsets.zero,
            constraints: BoxConstraints.expand(),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: height * 0.25,
                    child: Image.asset("assets/amalLogo.png")),
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
            )));
  }
}
