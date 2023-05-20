import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/Main%20page/mainPageNavigator.dart';
import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/charityadmin/charityadminmain.dart';
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
  final _formKey = GlobalKey<FormState>();
  FocusNode labelTextNode = new FocusNode();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  var isHidden = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
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
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "you must enter your email";
                          } else
                            return null;
                        },
                        controller: _emailController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: logoColor),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: logoColor,
                            )),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(15),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "you must enter the password";
                            } else
                              return null;
                          },
                          controller: _passwordController,
                          obscureText: isHidden,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: logoColor,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: logoColor),
                                  borderRadius: BorderRadius.circular(10)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 24, 102, 26)),
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isHidden) {
                                      isHidden = false;
                                    } else {
                                      isHidden = true;
                                    }
                                  });
                                },
                                icon: Icon(isHidden == true
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                color: logoColor,
                              )),
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 0.0001,
                ),
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
                            MaterialPageRoute(
                                builder: (context) => ForgotPass()),
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        final _firebase = FirebaseAuth.instance;

                        try {
                          UserCredential credential =
                              await _firebase.signInWithEmailAndPassword(
                                  email: email, password: password);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPageNavigator()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 5),
                              content: Text('user not found'),
                            ));
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 5),
                              content: Text('wrong pass'),
                            ));
                          }
                        }
                      }
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
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                        child: Text("bypass auth"))
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Charityadminmain()),
                      );
                    },
                    child: Text("chariy admin")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
