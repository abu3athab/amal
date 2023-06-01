import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/chairty%20page/charityitemlist.dart';
import 'package:demo2/chairty%20page/charitymainpage.dart';
import 'package:demo2/chairty%20page/productpage.dart';
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

class Charityadminmain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CharityadminmainChild();
  }
}

class CharityadminmainChild extends State<Charityadminmain> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var availableHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;

    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

    return SafeArea(
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Row(
                      children: [
                        Text(
                          "Tikyat Um Ali",
                          style: TextStyle(fontSize: width * 0.07),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Charityadminsettings()),
                            );
                          },
                          child: Container(
                            width: width * 0.1,
                            child: Image.asset("assets/settings.gif"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    width: width * 0.95,
                    height: height * 0.17,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: logoColor),
                    child: Column(children: [
                      Text(
                        "Report Card",
                        style: TextStyle(
                            fontSize: width * 0.05, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Row(
                          children: [
                            Text(
                              "Total dontations",
                              style: TextStyle(
                                  fontSize: width * 0.05, color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              "105",
                              style: TextStyle(
                                  fontSize: width * 0.05, color: Colors.white),
                            ),
                            SizedBox(
                              width: width * 0.07,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Row(
                          children: [
                            Text(
                              "Total Income",
                              style: TextStyle(
                                  fontSize: width * 0.05, color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              "3600",
                              style: TextStyle(
                                  fontSize: width * 0.05, color: Colors.white),
                            ),
                            SizedBox(
                              width: width * 0.07,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Productpage()),
                            );
                          },
                          child: Text(
                            "view detailed info",
                            style: TextStyle(fontSize: width * 0.04),
                          ))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "All Products and services",
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Editcharitymenu()),
                              );
                            },
                            child: Text("Edit Menu"))
                      ],
                    ),
                  ),
                  Expanded(
                      child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(uid)
                        .collection('myProducts')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, Index) {
                              String url =
                                  snapshot.data!.docs[Index].get('imageUrl');
                              return Charityitems(
                                  imageUrl: url,
                                  name: snapshot.data!.docs[Index]
                                      .get('product name'),
                                  desc: snapshot.data!.docs[Index].get('desc'),
                                  cost: snapshot.data!.docs[Index].get('cost'),
                                  categ:
                                      snapshot.data!.docs[Index].get('categ'));
                            });
                      }
                    },
                  )),
                  TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text("sign out"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
