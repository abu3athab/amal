import 'dart:ffi';

import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/paymentpages.dart/enterpaymentdetails.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/settings%20page/set.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';

class Notifcationsettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotifcationsettingsChild();
  }
}

class NotifcationsettingsChild extends State<Notifcationsettings> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.2,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Config()),
                            );
                          },
                        ),
                      ),
                      Text(
                        "Notifications",
                        style: TextStyle(fontSize: width * 0.08),
                      ),
                      Container(
                        width: width * 0.2,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Done",
                              style: TextStyle(fontSize: width * 0.06),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Allow Notifications",
                        style:
                            TextStyle(fontSize: width * 0.05, color: logoColor),
                      ),
                      SizedBox(
                        width: width * 0.2,
                        child: FittedBox(
                          child: Switch(
                            value: false,
                            activeColor: Colors.white,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.45,
                        child: Text(
                          "Allow urgent blood request notifications",
                          style: TextStyle(
                              fontSize: width * 0.05, color: logoColor),
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.2,
                        child: FittedBox(
                          child: Switch(
                            value: false,
                            activeColor: Colors.white,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.45,
                        child: Text(
                          "Allow volunteer event reminder notification",
                          style: TextStyle(
                              fontSize: width * 0.05, color: logoColor),
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.2,
                        child: FittedBox(
                          child: Switch(
                            value: false,
                            activeColor: Colors.white,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
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
