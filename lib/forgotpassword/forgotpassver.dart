import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/forgotpassword/changepass.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../log in/logIn.dart';
import 'forgotpass.dart';

class ForgotPassver extends StatelessWidget {
  EmailOTP myAuth;
  String email;
  ForgotPassver({required this.myAuth, required this.email});
  final otpController = OtpFieldController();
  bool isVerifiedOTP = false;
  String optValue = "";

  Future<void> sendResetPassEmail() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

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
              "A password reset link has been sent to your email address",
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you didn't receive a link!",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                    child: Text(
                      'Resend',
                      style: TextStyle(color: logoColor),
                    ),
                    onPressed: () async {
                      sendResetPassEmail();
                    }),
              ],
            ),
            SizedBox(
              height: 40,
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
                size: 26.0,
              ),
              label: Text('Go Back'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                  backgroundColor:
                      MaterialStateProperty.all(logoColor)), // <-- Text
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
                Icons.arrow_forward,
                size: 26.0,
              ),
              label: Text('login     '),
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
