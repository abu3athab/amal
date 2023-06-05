import 'dart:ffi';
import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/chairty%20page/charityitemlist.dart';
import 'package:demo2/chairty%20page/charitymainpage.dart';
import 'package:demo2/charityadmin/charityadminmain.dart';
import 'package:demo2/charityadmin/charityadminsettings.dart';
import 'package:demo2/charityadmin/editcharitymenu.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/log%20in/logIn.dart';
import 'package:demo2/profilepage.dart/profile.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/volunteermain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../chairty page/charitytiles.dart';

class Charitysettingpass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CharitysettingpassChild();
  }
}

class CharitysettingpassChild extends State<Charitysettingpass> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var availableHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;

    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: SideMenu(
          background: logoColor,
          key: _sideMenuKey,
          menu: Sidemenu(),
          type: SideMenuType.shrinkNSlide,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Charityadminsettings()),
                          );
                        },
                      ),
                      const Spacer(),
                      Text(
                        "Settings",
                        style: TextStyle(fontSize: width * 0.1),
                      ),
                      const Spacer(),
                      const Spacer(),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Edit your Password",
                    style: TextStyle(fontSize: width * 0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: email,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your email',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        child: const Text("Send password reset email"),
                        onPressed: () {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email.text);
                        },
                      )),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Charityadminsettings()),
                          );
                        },
                        icon: const Icon(
                          // <-- Icon
                          Icons.logout,
                          size: 24.0,
                        ),
                        label: const Text('Done'),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        )))
                        // <-- Text
                        ),
                  ),
                  const SizedBox(
                    height: 20,
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
