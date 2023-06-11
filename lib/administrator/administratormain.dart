import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/administrator/checkUrgent.dart';
import 'package:demo2/administrator/viewallcharities.dart';
import 'package:demo2/administrator/viewallusers.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../bloodpage/bloodmainpage.dart';
import '../chairty page/charitymainpage.dart';
import '../chairty page/charitytiles.dart';
import '../colors.dart';
import '../log in/logIn.dart';
import '../side bar/side_bar.dart';
import '../volunteer page/volunteermain.dart';
import 'adminBloodtiles.dart';
import 'adminCheckCharity.dart';
import 'adminVolunteerMain.dart';
import 'admincharityapprovalcard.dart';

class AdminMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdminMainChild();
  }
}

class AdminMainChild extends State<AdminMain> {
  // List<BloodRequesterModel> requester = List.empty(growable: true);
  CollectionReference urgentRef = FirebaseFirestore.instance
      .collection('bloodReq')
      .doc('IRfqh4URf73SlN04i2yQ')
      .collection('urgent');

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, Ahmed",
                              style: TextStyle(
                                  color: Colors.black, fontSize: width * 0.06),
                            ),
                            Text(
                              "This is your administrative page",
                              style: TextStyle(
                                  color: Colors.black, fontSize: width * 0.04),
                            ),
                            Text(
                              "Create great experience for all users",
                              style: TextStyle(
                                  color: Colors.black, fontSize: width * 0.04),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: height * 0.04,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
                        child: Text(
                          "Manage requests of users",
                          style: TextStyle(fontSize: width * 0.06),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Divider(
                    thickness: 2,
                  ),
                  Text(
                    "View the differnet aspects of the system",
                    style: TextStyle(fontSize: width * 0.045),
                  ),

                  /////////catagory bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.001,
                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Container(
                              width: width * 0.2,
                              child: Image.asset("assets/donate.gif"),
                            ),
                            Text(
                              "Charity",
                              style: TextStyle(
                                  fontSize: width * 0.04, color: Colors.black),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminCharitymain()),
                          );
                        },
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                              width: width * 0.2,
                              child: Image.asset("assets/blood-bag.gif"),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckUrgentMain()),
                              );
                            },
                          ),
                          Text(
                            "Blood donation",
                            style: TextStyle(
                                fontSize: width * 0.04, color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminVounteermain()),
                              );
                            },
                            child: Container(
                              width: width * 0.2,
                              child: Image.asset("assets/volunteering.gif"),
                            ),
                          ),
                          //added
                          Text(
                            "Volunteer",
                            style: TextStyle(
                                fontSize: width * 0.04, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width * 0.001,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
                    child: Text(
                      "Manage Chariies and users",
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewallCharities()),
                            );
                          },
                          child: Text(
                            "charities",
                            style: TextStyle(fontSize: width * 0.08),
                          )),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Viewallusers()),
                            );
                          },
                          child: Text("Users",
                              style: TextStyle(fontSize: width * 0.08))),
                      Spacer(),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text("sign out",
                          style: TextStyle(fontSize: width * 0.09)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
