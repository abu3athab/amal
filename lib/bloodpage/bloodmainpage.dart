import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';
import '../side bar/side_bar.dart';

class Bloodmain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BloodmainChild();
  }
}

class BloodmainChild extends State<Bloodmain> {
  // List<BloodRequesterModel> requester = List.empty(growable: true);
  FirebaseAuth? firebaseAuth = FirebaseAuth.instance;

  CollectionReference urgentBloodReqRef = FirebaseFirestore.instance
      .collection('bloodReq')
      .doc('IRfqh4URf73SlN04i2yQ')
      .collection('urgent');
  CollectionReference nonUrgentBloodReqRef = FirebaseFirestore.instance
      .collection('bloodReq')
      .doc('IRfqh4URf73SlN04i2yQ')
      .collection('nonurgent');

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
                    children: [
                      Container(
                          width: width * 0.1,
                          child: InkWell(
                            child: Image.asset("assets/menu.gif"),
                            onTap: () {
                              final _state = _sideMenuKey.currentState;
                              if (_state!.isOpened)
                                _state.closeSideMenu(); // close side menu
                              else
                                _state.openSideMenu();
                            },
                          )),
                      SizedBox(
                        width: width * 0.07,
                      ),
                      Flexible(
                        child: Text(
                          'Be the reason for someone’s heartbeat',
                          style: TextStyle(fontSize: width * 0.07),
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    width: width,
                    color: Colors.red,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Urgent requests",
                            style: TextStyle(
                                fontSize: width * 0.07, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "view all",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * 0.3,
                    child: Expanded(
                        child: StreamBuilder<Object>(
                            stream: urgentBloodReqRef.snapshots(),
                            builder: (context, snapshot) {
                              return FutureBuilder(
                                future: urgentBloodReqRef.get(),
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
                                          bool isVerified = snapshot
                                              .data!.docs[index]
                                              .get('isVerfied');
                                          if (isVerified) {
                                            return Bloodtiles(
                                              location: snapshot
                                                  .data!.docs[index]
                                                  .get('location name'),
                                              bloodType: snapshot
                                                  .data!.docs[index]
                                                  .get('blood type'),
                                              nOfUnits: snapshot
                                                  .data!.docs[index]
                                                  .get('number of units'),
                                            );
                                          } else
                                            return Container();
                                        }));
                                  }
                                },
                              );
                            })),
                  ),
                  ///////////////////////////////////////////////////////////////
                  Container(
                    width: width,
                    color: Colors.blue,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Non Urgent requests",
                            style: TextStyle(
                                fontSize: width * 0.07, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "view all",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * 0.29,
                    child: Expanded(
                        child: StreamBuilder<Object>(
                            stream: nonUrgentBloodReqRef.snapshots(),
                            builder: (context, snapshot) {
                              return FutureBuilder(
                                future: nonUrgentBloodReqRef.get(),
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
                                          bool isVerified = snapshot
                                              .data!.docs[index]
                                              .get('isVerfied');
                                          if (isVerified) {
                                            return Bloodtiles(
                                              location: snapshot
                                                  .data!.docs[index]
                                                  .get('location name'),
                                              bloodType: snapshot
                                                  .data!.docs[index]
                                                  .get('blood type'),
                                              nOfUnits: snapshot
                                                  .data!.docs[index]
                                                  .get('number of units'),
                                            );
                                          } else
                                            return Container();
                                        }));
                                  }
                                },
                              );
                            })),
                  ),

                  Container(
                      width: width,
                      height: height * 0.05,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Requestblood()),
                            );
                          },
                          child: Text(
                            "Request Blood",
                            style: TextStyle(fontSize: width * 0.078),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
