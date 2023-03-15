import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../log in/logIn.dart';
import 'forgotpassver.dart';

class forgotpass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return forgotpasschild();
  }
}

class forgotpasschild extends State<forgotpass> {
  final emailControllerpass = TextEditingController();
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
              "Forgot Password?",
              style: TextStyle(fontSize: 27, color: Colors.black),
            ),
            Container(
              child: Image.asset(
                "assets/sadgirlpassword.jpeg",
                height: height * 0.30,
              ),
            ),
            Text(
              "Please Enter the email address associated with your account",
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "we will send you a link to reset your password",
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
                decoration: InputDecoration(hintText: "Enter Email Address"),
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
                    MaterialPageRoute(builder: (context) => forgotpassver()),
                  );
                },
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                    backgroundColor: MaterialStateProperty.all(logoColor)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              icon: Icon(
                // <-- Icon
                Icons.arrow_back,
                size: 24.0,
              ),
              label: Text('Go Back'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                  backgroundColor:
                      MaterialStateProperty.all(logoColor)), // <-- Text
            ),
          ],
        ),
      ),
    );
  }
}
