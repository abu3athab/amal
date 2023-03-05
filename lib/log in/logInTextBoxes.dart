import 'package:flutter/material.dart';

class LogInTextBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LogInTextChild();
  }
}

class LogInTextChild extends State<LogInTextBox> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nationalIDController = TextEditingController();
  var isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "email",
                border: OutlineInputBorder(),
              ),
            )),
        Container(
          height: 75,
          padding: const EdgeInsets.all(10),
          child: TextField(
              obscureText: isHidden,
              cursorColor: Color.fromARGB(255, 24, 102, 26),
              controller: emailController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "password",
                  border: OutlineInputBorder(),
                  suffix: IconButton(
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
                          ? Icons.visibility
                          : Icons.visibility_off)))),
        ),
      ]),
    );
  }
}
