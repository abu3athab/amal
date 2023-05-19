import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';

class Charitymain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CharitymainChild();
  }
}

class CharitymainChild extends State<Charitymain> {
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
                  ////search bar/////////////////
                  Container(
                      width: width,
                      height: height * 0.10,
                      child: Row(
                        children: [
                          Container(
                              width: width * 0.1,
                              child: InkWell(
                                child: Image.asset("assets/menu.gif"),
                                onTap: () {
                                  final _state = _sideMenuKey.currentState;
                                  if (_state!.isOpened)
                                    _state.closeSideMenu(); // close side menu
                                  else
                                    _state.openSideMenu();
                                },
                              )),
                          Spacer(),
                          Container(
                            width: width * 0.7,
                            child: TextField(
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1)),
                                hintText: 'Try Charity,Food.clothing...',
                              ),
                              style: TextStyle(fontSize: height * 0.021),
                            ),
                          ),
                          Spacer(),
                          Container(
                              width: width * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child:
                                  Image.asset("assets/magnifying-glass.gif")),
                        ],
                      )),
                  ////////search bar/////////////////
                  Divider(
                    thickness: 1,
                  ),

                  ////
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                                width: width * 0.15,
                                child: Image.asset('assets/food-donation.gif')),
                            Text(
                              "Food",
                              style: TextStyle(fontSize: height * 0.03),
                            ),
                          ],
                        ),
                        ///////////////////////////////
                        Spacer(),
                        Column(
                          children: [
                            Container(
                                width: width * 0.15,
                                child: Image.asset('assets/clothes.gif')),
                            Text(
                              "Clothing",
                              style: TextStyle(fontSize: height * 0.03),
                            ),
                          ],
                        ),
                        ////////////////////////////////////////
                        Spacer(),
                        Column(
                          children: [
                            Container(
                                width: width * 0.15,
                                child:
                                    Image.asset('assets/air-conditioner.gif')),
                            Text(
                              "Utilities",
                              style: TextStyle(fontSize: height * 0.03),
                            ),
                          ],
                        ),
                      ],
                    ),
                    /////////
                  ),

                  ///
                  Row(
                    children: [
                      Spacer(),
                      Column(
                        children: [
                          Container(
                              width: width * 0.15,
                              child: Image.asset('assets/juggling.gif')),
                          Text(
                            "Fun",
                            style: TextStyle(fontSize: height * 0.03),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Container(
                              width: width * 0.15,
                              child: Image.asset('assets/graduation.gif')),
                          Text(
                            "Education",
                            style: TextStyle(fontSize: height * 0.03),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  ////////////////////////////////////
                  Row(
                    children: [
                      Text("Featured Charities"),
                      Spacer(),
                      TextButton(onPressed: () {}, child: Text("view all"))
                    ],
                  ),
                  Expanded(
                      child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Charitytiles(),
                      Charitytiles(),
                      Charitytiles(),
                      Charitytiles(),
                      Charitytiles(),
                      Charitytiles(),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
