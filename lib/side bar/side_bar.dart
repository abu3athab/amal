import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        body: Container(
      width: width * 0.7,
      height: height,
      color: logoColor,
      child: SafeArea(
        child: Column(children: [
          //info card start//////////////////////////////
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/girlportrait.jpeg'),
              radius: height * 0.04,
            ),
            title: Text(
              "Alessandra Lauren",
              style: TextStyle(color: Colors.white),
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
          ListTile(
            leading: Icon(
              Icons.home,
              size: width * 0.1,
            ),
            title: Text(
              "Home",
              style: TextStyle(fontSize: width * 0.05, color: Colors.white),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////

          //button tiles////////////////////////
          ListTile(
            leading: Icon(
              Icons.favorite,
              size: width * 0.1,
            ),
            title: Text(
              "Charity",
              style: TextStyle(fontSize: width * 0.05, color: Colors.white),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////

          //button tiles////////////////////////
          ListTile(
            leading: Icon(
              Icons.bloodtype,
              size: width * 0.1,
            ),
            title: Text(
              "Blood Donation",
              style: TextStyle(fontSize: width * 0.05, color: Colors.white),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////

          //button tiles////////////////////////
          ListTile(
            leading: Icon(
              Icons.handshake,
              size: width * 0.1,
            ),
            title: Text(
              "Volunteer",
              style: TextStyle(fontSize: width * 0.05, color: Colors.white),
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
          ListTile(
            leading: Icon(
              Icons.account_circle_rounded,
              size: width * 0.1,
            ),
            title: Text(
              "Profile",
              style: TextStyle(fontSize: width * 0.05, color: Colors.white),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////

          //button tiles////////////////////////
          ListTile(
            leading: Icon(
              Icons.settings,
              size: width * 0.1,
            ),
            title: Text(
              "Settings",
              style: TextStyle(fontSize: width * 0.05, color: Colors.white),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          //button tiles////////////////////////
        ]),
      ),
    ));
  }
}
