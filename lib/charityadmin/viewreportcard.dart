import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/chairty%20page/charityitemlist.dart';
import 'package:demo2/chairty%20page/charitymainpage.dart';
import 'package:demo2/chairty%20page/productpage.dart';
import 'package:demo2/charityadmin/charityadminmain.dart';
import 'package:demo2/charityadmin/charityadminsettings.dart';
import 'package:demo2/charityadmin/editcharitymenu.dart';
import 'package:demo2/charityadmin/reportpurchasecard.dart';
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
import 'charityAdminItems.dart';

class Viewreport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewreportChild();
  }
}

class ViewreportChild extends State<Viewreport> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  var fire = FirebaseFirestore.instance.collection('Users');
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
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Charityadminmain()),
                            );
                          },
                        ),
                        Spacer(),
                        Text(
                          "Charity Report",
                          style: TextStyle(fontSize: width * 0.08),
                        ),
                        Spacer(),
                        Spacer(),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: logoColor,
                          border: Border.all(
                            color: logoColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: width * 0.95,
                      height: height * 0.85,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Charity name",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Total Income in jod : ",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              Text("amount",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Number of Doners: ",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              Text("amount",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Expanded(
                            child: ListView(
                          children: [
                            Charityreportcard(),
                            Charityreportcard(),
                            Charityreportcard(),
                            Charityreportcard(),
                            Charityreportcard(),
                          ],
                        ))
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
