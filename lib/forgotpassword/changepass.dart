import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../log in/logIn.dart';
import 'forgotpassver.dart';

class changepass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return changepasschild();
  }
}

class changepasschild extends State<changepass> {
  final emailControllerpass = TextEditingController();
  final emailControllerpass2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              height: height * 0.1,
            ),
            Text(
              "Yay Success!!",
              style: TextStyle(fontSize: 27, color: Colors.black),
            ),
            Container(
              child: Image.asset(
                "assets/happygirlpassword.jpeg",
                height: height * 0.30,
              ),
            ),
            Text(
              "Enter your new password",
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "And we will take care of the rest",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: width * 0.8,
              child: TextField(
                controller: emailControllerpass,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: "New password"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width * 0.8,
              child: TextField(
                controller: emailControllerpass2,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: "confirm New password"),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              width: width * 0.6,
              height: height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  "Change",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                    backgroundColor: MaterialStateProperty.all(logoColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
