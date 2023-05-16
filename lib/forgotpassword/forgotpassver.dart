import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/forgotpassword/changepass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../log in/logIn.dart';
import 'forgotpass.dart';

class ForgotPassver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ForgotPassverChild();
  }
}

class ForgotPassverChild extends State<ForgotPassver> {
  final emailControllerpass = TextEditingController();
  final optController = OtpFieldController();
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
              "Verification",
              style: TextStyle(fontSize: 27, color: Colors.black),
            ),
            Container(
              child: Image.asset(
                "assets/2255657.jpg",
                height: height * 0.30,
              ),
            ),
            Text(
              "Enter the verification code we just sent you on your email address",
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width * 0.8,
              child: OTPTextField(
                controller: optController,
                onChanged: (value) {
                  if (value != null) {
                    print("jellp");
                  }
                },
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: width * 0.122,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you didn't receive a code!",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                    child: Text(
                      'Resend',
                      style: TextStyle(color: logoColor),
                    ),
                    onPressed: () {}),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: width * 0.6,
              height: height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => changepass()),
                  );
                },
                child: Text(
                  "Verify",
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
                  MaterialPageRoute(builder: (context) => ForgotPass()),
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
