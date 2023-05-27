import 'package:demo2/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResendVerLinkChild extends StatelessWidget {
  ResendVerLinkChild(
      {User? user,
      String? name,
      String? email,
      String? phoneNumber,
      String? password});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sign up/resend verification link"),
        backgroundColor: logoColor,
      ),
      body: TextButton(
        child: Text(
          "resend",
          style: TextStyle(color: logoColor),
        ),
        onPressed: () => null,
      ),
    );
  }
}
