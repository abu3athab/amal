import 'dart:ffi';

import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/chairty%20page/charitymainpage.dart';

import 'package:demo2/colors.dart';
import 'package:demo2/profilepage.dart/profile.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/volunteermain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../chairty page/charitytiles.dart';

class Volunteereventinfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VolunteereventinfoChild();
  }
}

class VolunteereventinfoChild extends State<Volunteereventinfo> {
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
                      height: height * 0.06,
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.25,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_back_ios)),
                          ),
                          Container(
                            width: width * 0.5,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Text(
                                "Park Cleaing",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      )),
                  Container(
                    width: width,
                    height: height * 0.2,
                    child: Image.asset(
                        "assets/Community-Donation-Drive-Feature-Image-01.webp"),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Text(
                    "Event info",
                    style: TextStyle(fontSize: width * 0.07),
                  ),
                  SizedBox(
                    width: width,
                    height: height * 0.05,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Text(
                        "Event description",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  //////
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Text(
                        "fhhdhfjhsdofjsjidfijsadhfihsbdfihbasdfihbishdafbfudbafihbiadfhbihdabfhahbfdibadishfoijfidjsidbfib",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Text(
                        "Event start time",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  //////
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Text(
                        "9AM",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Text(
                        "Event finish time",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  //////
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Text(
                        "2PM",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  /////////////////
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Text(
                        "Event Location",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  //////
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Text(
                        "Amman jubiha",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width,
                    height: height * 0.1,
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: Text("Count me in!!!"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
