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
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return WideLayout();
          } else {
            return NarrowLayout();
          }
        }));
  }
}

class WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NarrowLayout(),
      color: Colors.red,
    );
  }
}

class NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/signUpImage.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset("lib/assets/amalLogo.png"),
            ),
            const Text(
              "Log In",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Container(child: new LogInTextBox()),
            Container(
              child: Row(
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
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: 210,
              child: ElevatedButton(
                onPressed: null,
                child: Text(
                  "Login",
                  style: TextStyle(color: Color.fromARGB(154, 0, 0, 0)),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 72, 201, 22)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Color.fromARGB(255, 24, 102, 26)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
