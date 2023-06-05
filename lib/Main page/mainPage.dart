import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/chairty%20page/charitymainpage.dart';

import 'package:demo2/colors.dart';
import 'package:demo2/profilepage.dart/profile.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/volunteermain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../chairty page/charitytiles.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageChild();
  }
}

class MainPageChild extends State<MainPage> {
  var fire = FirebaseFirestore.instance.collection('Users');
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
                  Container(
                    width: width,
                    height: availableHeight * 0.215,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(children: [
                      SizedBox(height: availableHeight * .02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<DocumentSnapshot>(
                                    future: fire
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Text("");
                                      } else {
                                        String username =
                                            snapshot.data!.get('name');

                                        return Text(
                                          "Hi, $username",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: width * 0.06),
                                        );
                                      }
                                    }),
                                Text(
                                  "Let's start spreading goodness",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.04),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: height * 0.04,
                          )
                        ],
                      ),
                      SizedBox(
                          width: width,
                          height: height * 0.10,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: width * 0.1,
                                  child: InkWell(
                                    child: Image.asset("assets/menu.gif"),
                                    onTap: () {
                                      final _state = _sideMenuKey.currentState;
                                      if (_state!.isOpened) {
                                        _state
                                            .closeSideMenu(); // close side menu
                                      } else
                                        _state.openSideMenu();
                                    },
                                  )),
                              const Spacer(),
                              SizedBox(
                                width: width * 0.7,
                                child: TextField(
                                  cursorColor: Colors.grey,
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    hintText: 'Try Charity,Food.clothing...',
                                  ),
                                  style: TextStyle(fontSize: height * 0.021),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                  width: width * 0.1,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: InkWell(
                                    child: Image.asset(
                                        "assets/magnifying-glass.gif"),
                                    onTap: () {},
                                  )),
                            ],
                          )),
                    ]),
                  ),
                  //////////////////////////////////catagory row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.001,
                      ),
                      InkWell(
                        child: Column(
                          children: [
                            SizedBox(
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
                                builder: (context) => Charitymain()),
                          );
                        },
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: SizedBox(
                              width: width * 0.2,
                              child: Image.asset("assets/blood-bag.gif"),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bloodmain()),
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
                                    builder: (context) => Vounteermain()),
                              );
                            },
                            child: SizedBox(
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
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Featured Charities",
                          style: TextStyle(
                              fontSize: width * 0.05, color: Colors.black)),
                    ),
                  ),
                  //////////////////////////////////catagory row//////////////////////////
                  ///
                  ///
                  /////////list view//////////////////////////////////////////////////////
                  Expanded(
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection('Users')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                            documents = snapshot.data!.docs;
                        final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                            charityDocuments = documents
                                .where((doc) => doc['type'] == 'charity')
                                .toList();

                        return ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: charityDocuments.length,
                          itemBuilder: (BuildContext context, int index) {
                            final QueryDocumentSnapshot<Map<String, dynamic>>
                                document = charityDocuments[index];
                            final String userId = document.id;
                            bool isVerfied = document['isVerfied'];
                            if (isVerfied) {
                              return Charitytiles(
                                charityName: document['charity name'],
                                location: document['location'],
                                bio: document['charity bio'],
                                charityID: document['uid'],
                                imageUrl: document['imageUrl'],
                                donersNumber: document['count'],
                              );
                            } else {
                              return Container();
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
