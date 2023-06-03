import 'dart:ffi';

import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/log%20in/user.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';
import 'choosepaymentmethode.dart';

class Enterpaymentdetail extends StatefulWidget {
  String itemID;
  int cost;
  String uid;
  Enterpaymentdetail(
      {required this.itemID, required this.cost, required this.uid});
  @override
  State<StatefulWidget> createState() {
    return EnterpaymentdetailChild();
  }
}

class EnterpaymentdetailChild extends State<Enterpaymentdetail> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Choosepayment(
                                      itemID: widget.itemID,
                                      cost: widget.cost,
                                      uid: widget.uid,
                                    )),
                          );
                        },
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Canel",
                            style: TextStyle(fontSize: width * 0.06),
                          ))
                    ],
                  ),
                  Container(
                    child: Image.asset(
                      "assets/happygirlpassword.jpeg",
                      height: height * 0.30,
                    ),
                  ),
                  Text(
                    "please fill out this form",
                    style: TextStyle(fontSize: width * 0.06),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card number',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder Name',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width * 0.5,
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Exp date MM/YY',
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: width * 0.3,
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CCV',
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: width * 0.9,
                    height: height * 0.08,
                    child: ElevatedButton(
                        child: Text("Complete payment",
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ))),
                        onPressed: () async {
                          String time = DateTime.now().toString();
                          addPurchasesOfUsers(
                              widget.uid, widget.itemID, widget.cost, time);
                        }),
                  ),
                  SizedBox(
                    height: 20,
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
