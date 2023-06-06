import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
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
                    Row(
                      children: [
                        Container(
                            width: width * 0.1,
                            child: InkWell(
                                child: Icon(Icons.arrow_back_ios_new),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Bloodmain()),
                                  );
                                })),
                        Spacer(),
                        Text(
                          "Blood Request",
                          style: TextStyle(fontSize: width * 0.1),
                        ),
                        Spacer(),
                        Spacer()
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      " location: ${location} ",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    Expanded(child: SizedBox()),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
