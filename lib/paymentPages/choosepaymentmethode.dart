import 'dart:ffi';

import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';
import '../log in/user.dart';
import '../paypal/paypalPayment.dart';
import 'enterpaymentdetails.dart';

class Choosepayment extends StatefulWidget {
  final String itemID;
  final String itemName;
  final double cost;
  final String charityID;

  Choosepayment(
      {super.key,
      required this.itemID,
      required this.cost,
      required this.itemName,
      required this.charityID});

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
      decoration: const BoxDecoration(
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
            appBar: AppBar(
              title: Text("Payment methods"),
              backgroundColor: logoColor,
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.02),
                  Image.asset(
                      "assets/WhatsApp Image 2023-05-31 at 6.54.40 PM.jpeg"),
                  InkWell(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Enterpaymentdetail()),
                    //   );
                    // },
                    child: SizedBox(
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
                            SizedBox(
                              width: width * 0.3,
                              child: Image.asset(
                                  "assets/WhatsApp Image 2023-05-31 at 6.54.36 PM.jpeg"),
                            ),
                            const Spacer(),
                            Text(
                              "Credit/Debit Cards",
                              style: TextStyle(fontSize: width * 0.05),
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  SizedBox(
                    width: width * 0.95,
                    child: InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaypalPayment(
                                    itemName: widget.itemName,
                                    itemPrice: widget.cost.toString(),
                                    onFinish: (number) async {
                                      print('order id : $number');
                                      String time = DateTime.now().toString();
                                      await addPurchasesOfUsers(
                                          FirebaseAuth
                                              .instance.currentUser!.uid,
                                          widget.itemID,
                                          widget.cost,
                                          time,
                                          widget.charityID);
                                    },
                                  )),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.3,
                              child: Image.asset(
                                  "assets/WhatsApp Image 2023-05-31 at 6.54.31 PM.jpeg"),
                            ),
                            const Spacer(),
                            Text(
                              "Paypal Payment",
                              style: TextStyle(fontSize: width * 0.05),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  const SizedBox(
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
