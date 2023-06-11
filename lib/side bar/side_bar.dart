import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/chairty%20page/charitymainpage.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/profilepage.dart/profile.dart';
import 'package:flutter/material.dart';

import '../settings page/set.dart';
import '../settings page/settingspage.dart';
import '../volunteer page/volunteermain.dart';

class Sidemenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Sidemenuchild();
  }
}

class Sidemenuchild extends State<Sidemenu> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: width * 1,
        height: height,
        color: logoColor,
        child: Column(children: [
          //info card start//////////////////////////////
          ListTile(
            leading: CircleAvatar(
              radius: height * 0.04,
            ),
            subtitle: Text(
              "Doner Account",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          //info card finish////////////////////////////////
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, height * 0.025, 0, height * 0.02),
              child: Text(
                "Browse",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.08,
                ),
              ),
            ),
          ),

          //button tiles////////////////////////
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
                size: width * 0.1,
              ),
              title: Text(
                "Home",
                style: TextStyle(fontSize: width * 0.05, color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////

          //button tiles////////////////////////
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Charitymain()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
                size: width * 0.1,
              ),
              title: Text(
                "Charity",
                style: TextStyle(fontSize: width * 0.05, color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////

          //button tiles////////////////////////
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bloodmain()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.bloodtype,
                color: Colors.white,
                size: width * 0.1,
              ),
              title: Text(
                "Blood Donation",
                style: TextStyle(fontSize: width * 0.05, color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////

          //button tiles////////////////////////
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Vounteermain()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.handshake,
                size: width * 0.1,
                color: Colors.white,
              ),
              title: Text(
                "Volunteer",
                style: TextStyle(fontSize: width * 0.05, color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////

          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, height * 0.05, 0, height * 0.02),
              child: Text(
                "Utilities",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.08,
                ),
              ),
            ),
          ),

          //button tiles////////////////////////
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.account_circle_rounded,
                size: width * 0.1,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: width * 0.05, color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////

          //button tiles////////////////////////
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Config()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.settings,
                size: width * 0.1,
                color: Colors.white,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: width * 0.05, color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////
        ]),
      )),
    );
  }
}
