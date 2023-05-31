import 'dart:ffi';

import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/paymentpages.dart/enterpaymentdetails.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';

class Choosepayment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChoosepaymentChild();
  }
}

class ChoosepaymentChild extends State<Choosepayment> {
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
                        onPressed: () {},
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
                  Text(
                    "Payment methods",
                    style: TextStyle(fontSize: width * 0.1),
                  ),
                  SizedBox(height: height * 0.02),
                  Image.asset("assets/134f5ae68da7359ee1a9de60c47260d4 2.png"),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Enterpaymentdetail()),
                      );
                    },
                    child: Container(
                      width: width * 0.95,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.3,
                              child:
                                  Image.asset("assets/visa-logo-800x450.webp"),
                            ),
                            Spacer(),
                            Text(
                              "Credit/Debit Cards",
                              style: TextStyle(fontSize: width * 0.05),
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: width * 0.95,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Image.asset("assets/PayPal-Logo.png"),
                          ),
                          Spacer(),
                          Text(
                            "Paypal Payment",
                            style: TextStyle(fontSize: width * 0.05),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: width * 0.9,
                    height: height * 0.08,
                    child: ElevatedButton(
                        child: Text("Enter payment Detailes",
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ))),
                        onPressed: () => null),
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
