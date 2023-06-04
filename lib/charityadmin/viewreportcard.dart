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
                            "All users donations ",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("userTransactions")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    String uid = snapshot.data!.docs[index]
                                        .get('userID');
                                    String charityID = snapshot
                                        .data!.docs[index]
                                        .get('charityID');
                                    String itemID = snapshot.data!.docs[index]
                                        .get('itemID');

                                    return FutureBuilder<DocumentSnapshot>(
                                      future: FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(uid)
                                          .get(),
                                      builder: (context, userSnapshot) {
                                        if (userSnapshot.hasData) {
                                          var userName =
                                              userSnapshot.data!.get('name');
                                          return FutureBuilder<
                                              DocumentSnapshot>(
                                            future: FirebaseFirestore.instance
                                                .collection('Users')
                                                .doc(charityID)
                                                .get(),
                                            builder:
                                                (context, charitySnapshot) {
                                              if (charitySnapshot.hasData) {
                                                var charityName =
                                                    charitySnapshot.data!
                                                        .get('charity name');

                                                return FutureBuilder<
                                                    DocumentSnapshot>(
                                                  future: FirebaseFirestore
                                                      .instance
                                                      .collection('Users')
                                                      .doc(charityID)
                                                      .collection('myProducts')
                                                      .doc(itemID)
                                                      .get(),
                                                  builder: (context,
                                                      productSnapshot) {
                                                    if (productSnapshot
                                                        .hasData) {
                                                      var productName =
                                                          productSnapshot.data!
                                                              .get(
                                                                  'product name');
                                                      var cost = productSnapshot
                                                          .data!
                                                          .get('cost')
                                                          .toString();
                                                      return Charityreportcard(
                                                          charityName:
                                                              charityName,
                                                          username: userName,
                                                          productName:
                                                              productName,
                                                          cost: cost);
                                                    } else if (productSnapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return CircularProgressIndicator();
                                                    }
                                                    return SizedBox();
                                                  },
                                                );
                                              } else if (charitySnapshot
                                                      .connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              }
                                              return SizedBox();
                                            },
                                          );
                                        } else if (userSnapshot
                                                .connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        }
                                        return SizedBox();
                                      },
                                    );
                                  },
                                );
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              return SizedBox();
                            },
                          ),
                        )
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
