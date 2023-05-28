import 'package:demo2/chairty%20page/charitymainpage.dart';
import 'package:demo2/sign%20up/entercharitydetails.dart';
import 'package:demo2/sign%20up/signUpCharity.dart';
import 'package:flutter/material.dart';

import 'package:demo2/colors.dart';
import 'package:demo2/log%20in/logIn.dart';
import 'package:demo2/log%20in/user.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../forgotpassword/forgotpass.dart';

class CharityOTP extends StatelessWidget {
  EmailOTP auth;
  String userName;
  String email;
  String password;
  String phoneNumber;
  CharityOTP(
      {required this.auth,
      required this.userName,
      required this.email,
      required this.password,
      required this.phoneNumber});
  String otpValue = "";

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
                onChanged: (value) {
                  if (value != null) {
                    otpValue = value;
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
                    onPressed: () async {
                      auth.setConfig(
                          appEmail: "ahmed.alkhatib13@gmail.com",
                          appName: "Email OTP",
                          userEmail: email,
                          otpLength: 4,
                          otpType: OTPType.digitsOnly);
                      if (await auth.sendOTP() == true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("OTP has been sent"),
                        ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Oops, OTP send failed"),
                        ));
                      }
                    }),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: width * 0.6,
              height: height * 0.07,
              child: ElevatedButton(
                onPressed: () async {
                  if (await auth.verifyOTP(otp: otpValue)) {
                    try {
                      final userCredentials = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);
                      addCharity(userName, email, phoneNumber, 'charity');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 5),
                          content: Text('this email is already registered'),
                        ));
                      } else if (e.code == 'error_invalid_email') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 5),
                            content: Text('invalid ')));
                      } else if (e.code == "ERROR_INVALID_CREDENTIAL") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 5),
                            content: Text('invalid credentials ')));
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("OPT verified"),
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("your entered OPT doesn't the sent one"),
                      duration: Duration(seconds: 2),
                    ));
                  }
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
                  MaterialPageRoute(builder: (context) => SignUpChartiy()),
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
