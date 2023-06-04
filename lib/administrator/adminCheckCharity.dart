import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/administrator/administratormain.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/charityadmin/charityadminmain.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';
import 'adminCharityTiles.dart';

class AdminCharitymain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdminCharitymainChild();
  }
}

class AdminCharitymainChild extends State<AdminCharitymain> {
  CollectionReference userRef = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

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
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminMain()),
                        );
                      },
                    ),
                    Spacer(),
                    Text(
                      "Approve Charities",
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
                  width: width * 0.4,
                  child: Image.asset("assets/donate.gif"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "these are charities awaiting approval from you, please review them and deciede if they will approved or not.",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Expanded(
                    child: StreamBuilder<Object>(
                        stream: userRef.snapshots(),
                        builder: (context, snapshot) {
                          return FutureBuilder(
                            future: userRef.get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasError) {
                                return Text("error: ${snapshot.error}");
                              } else {
                                return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: ((context, index) {
                                      bool isVerfied = snapshot
                                          .data!.docs[index]
                                          .get('isVerfied');
                                      String type = snapshot.data!.docs[index]
                                          .get('type');
                                      if (!isVerfied && type == 'charity') {
                                        return AdminCharitytiles(
                                          location: snapshot.data!.docs[index]
                                              .get('location'),
                                          charityName: snapshot
                                              .data!.docs[index]
                                              .get('charity name'),
                                          uid: snapshot.data!.docs[index]
                                              .get('uid'),
                                          name: snapshot.data!.docs[index]
                                              .get('name'),
                                          phoneNumber: snapshot
                                              .data!.docs[index]
                                              .get('phone number'),
                                          email: snapshot.data!.docs[index]
                                              .get('email'),
                                        );
                                      } else
                                        return Container();
                                    }));
                              }
                            },
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
