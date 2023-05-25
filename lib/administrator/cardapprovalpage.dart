import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../log in/user.dart';

class Cardapprovalpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CardapprovalpageChild();
  }
}

class CardapprovalpageChild extends State<Cardapprovalpage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white])),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "charity name",
                      style: TextStyle(fontSize: width * 0.1),
                    ),
                    Spacer(),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.25,
                  child: Image.asset(
                      'assets/facebook-template-with-humanitary-aid-refugees-conceptwatercolor_83728-9598.png'),
                ),
                Text(
                  "description",
                  style: TextStyle(fontSize: width * 0.07),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "njdenfkbnfkejqbnhjbefhjbjhqfbdghjqebfhbsqjhdbfhbeqdjhfbjhbdfjhbdwjbfjhwbedfjhbjwbfbjh",
                    style: TextStyle(fontSize: width * 0.05),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Location:",
                        style: TextStyle(fontSize: width * 0.06),
                      ),
                      Text(
                        "Amman",
                        style: TextStyle(fontSize: width * 0.06),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Owner info:",
                        style: TextStyle(fontSize: width * 0.06),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("name: ", style: TextStyle(fontSize: width * 0.06)),
                      Text("Ahmad al khateeb",
                          style: TextStyle(fontSize: width * 0.06)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Email: ", style: TextStyle(fontSize: width * 0.06)),
                      Text("his20190203@std.psut.edu.jo",
                          style: TextStyle(fontSize: width * 0.05)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Phone number: ",
                          style: TextStyle(fontSize: width * 0.06)),
                      Text("0790741003",
                          style: TextStyle(fontSize: width * 0.06)),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.45,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Approve",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.08),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: width * 0.45,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Deny",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.08),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
