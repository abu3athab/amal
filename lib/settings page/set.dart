import 'dart:developer';

import 'package:demo2/colors.dart';
import 'package:demo2/settings%20page/settingspage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../log in/logIn.dart';
import 'editPro.dart';

class Config extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConfigChild();
  }
}

class ConfigChild extends State<Config> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        SizedBox(
          height: 0.05 * height,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()),
                          ),
            title: Text("Edit profile"),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: logoColor,
            ),
            leading: Icon(
              Icons.account_circle,
              color: logoColor,
            ),
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            onTap: () => null,
            title: Text("Edit email"),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: logoColor,
            ),
            leading: Icon(
              Icons.email,
              color: logoColor,
            ),
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            onTap: () => null,
            title: Text("Edit password"),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: logoColor,
            ),
            leading: Icon(
              Icons.lock,
              color: logoColor,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            onTap: () => null,
            title: Text("Notifications"),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: logoColor,
            ),
            leading: Icon(
              Icons.notification_add_rounded,
              color: logoColor,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            onTap: () => null,
            title: Text("Edit language"),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: logoColor,
            ),
            leading: Icon(
              Icons.language_rounded,
              color: logoColor,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            title: Text("Log out"),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: logoColor,
            ),
            leading: Icon(
              Icons.logout,
              color: logoColor,
            ),
          ),
        ),
      ]),
    );
  }
}
