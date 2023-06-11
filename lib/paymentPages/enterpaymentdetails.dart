import 'dart:ffi';

import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitymainpage.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/log%20in/user.dart';
import 'package:demo2/paypal/paypalPayment.dart';
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

class EnterPaymentDetail extends StatefulWidget {
  final String itemID;
  final double cost;
  final String itemName;
  final String charityID;

  const EnterPaymentDetail(
      {super.key,
      required this.itemID,
      required this.cost,
      required this.itemName,
      required this.charityID});

  @override
  State<StatefulWidget> createState() {
    return EnterpaymentdetailChild();
  }
}

class EnterpaymentdetailChild extends State<EnterPaymentDetail> {
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
              title: Text("Payment page"),
              backgroundColor: logoColor,
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field must not be empty";
                      } else
                        return null;
                    },
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card number',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field must not be empty";
                      } else
                        return null;
                    },
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder Name',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.5,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field must not be empty";
                            } else
                              return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Exp date MM/YY',
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: width * 0.3,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field must not be empty";
                            } else
                              return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CCV',
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                    width: width * 0.9,
                    height: height * 0.08,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(logoColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ))),
                        onPressed: () async {
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
                        child: const Text("Complete payment",
                            style: TextStyle(fontSize: 14))),
                  ),
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
