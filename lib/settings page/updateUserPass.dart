import 'dart:ffi';
import 'dart:math';

import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/log%20in/user.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/settings%20page/set.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';

class UpdateUserPass extends StatelessWidget {
  var email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
    final _nameKey = GlobalKey<FormState>();
    final _numberKey = GlobalKey<FormState>();

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white])),
      child: SafeArea(
        bottom: false,
        child: SideMenu(
          background: logoColor,
          key: _sideMenuKey,
          menu: Sidemenu(),
          type: SideMenuType.shrinkNSlide,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.2,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Config()),
                            );
                          },
                        ),
                      ),
                      Text(
                        "Reset password",
                        style: TextStyle(fontSize: width * 0.1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    children: <Widget>[
                      const Text("Email"),
                      Container(
                        width: width * 0.03,
                      ),
                      Flexible(
                        child: Form(
                          key: _numberKey,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field must not be empty";
                              } else {
                                return null;
                              }
                            },
                            controller: email,
                            decoration: InputDecoration(),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            if (_numberKey.currentState!.validate()) {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(email: email.text);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Reset password link has been sent to your email successfully! ${email.text}")));
                            } else {
                              return;
                            }
                          },
                          child: const Text("Send link")),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
