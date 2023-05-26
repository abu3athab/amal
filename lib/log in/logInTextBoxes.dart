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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double minheight = height;
    if (height < 500) {
      minheight = 50;
    }
    return Center(
      child: Column(children: [
        if (height < 500)
          Container(
              height: minheight,
              width: width * 0.9,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: userNameController,
                cursorColor: Color.fromARGB(255, 24, 102, 26),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "email",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 24, 102, 26)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 24, 102, 26)),
                        borderRadius: BorderRadius.circular(10))),
              )),

        if (height < 500)
          Container(
              height: minheight,
              width: width * 0.9,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: userNameController,
                cursorColor: Color.fromARGB(255, 24, 102, 26),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "password",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 24, 102, 26)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 24, 102, 26)),
                        borderRadius: BorderRadius.circular(10)),
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
                            : Icons.visibility_off))),
              )),
        if (height > 500)
          Container(
              height: height * 0.1,
              width: width * 0.9,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: userNameController,
                cursorColor: Color.fromARGB(255, 24, 102, 26),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "password",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 24, 102, 26)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 24, 102, 26)),
                        borderRadius: BorderRadius.circular(10)),
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
                        icon: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(isHidden == true
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ))),
              ))
        // Container(
        //   height: 75,
        //   padding: const EdgeInsets.all(10),
        //   child: TextField(
        //       obscureText: isHidden,
        //       cursorColor: Colors.greenAccent,
        //       controller: emailController,
        //       decoration: InputDecoration(
        //           filled: true,
        //           fillColor: Colors.white,
        //           labelText: "password",
        //           labelStyle:
        //               TextStyle(color: Color.fromARGB(255, 24, 102, 26)),
        //           border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(10),
        //               borderSide: BorderSide(width: 3)),

        //          )),
        // ),
      ]),
    );
  }
}
