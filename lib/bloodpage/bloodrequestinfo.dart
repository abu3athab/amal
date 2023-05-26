import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';
import '../side bar/side_bar.dart';

class Bloodrequestindo extends StatelessWidget {
  String location;
  String bloodType;
  String nOfUnits;
  Bloodrequestindo(
      {required this.location,
      required this.bloodType,
      required this.nOfUnits});

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
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(
                                20.0) //                 <--- border radius here
                            ),
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          bloodType,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text(
                            "Units Needed",
                            style: TextStyle(fontSize: width * 0.07),
                          ),
                          Spacer(),
                          Text(nOfUnits,
                              style: TextStyle(fontSize: width * 0.07))
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.9,
                      height: height * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(
                                20.0) //                 <--- border radius here
                            ),
                      ),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          " location: ${location} ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.45,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.all(Radius.circular(
                                      20.0) //                 <--- border radius here
                                  ),
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Call",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: width * 0.45,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(
                                      20.0) //                 <--- border radius here
                                  ),
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "I will Help",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
