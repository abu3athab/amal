import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';

class LogInTextFields extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LogInTextFieldsChild();
  }
}

class LogInTextFieldsChild extends State<LogInTextFields> {
  FocusNode labelTextNode = new FocusNode();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  String getUserPassword() {
    return this._passwordController.text;
  }

  String getUserEmail() {
    return this._emailController.text;
  }

  var isHidden = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: TextField(
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
                            width: 3, color: Color.fromARGB(255, 24, 102, 26)),
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
    );
  }
}
