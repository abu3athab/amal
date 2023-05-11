import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/volunteer%20page/createnewevent.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:flutter/material.dart';

class Manageevents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ManageeventsChild();
  }
}

class ManageeventsChild extends State<Manageevents> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _editProfileKey = GlobalKey<FormState>();

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white])),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 8, 8),
            child: Column(
              children: [
                Container(
                  width: width,
                  child: Text(
                    "Manage your active events",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: width * 0.065),
                  ),
                ),
                Container(
                  width: width,
                  height: height * 0.75,
                  child: Expanded(
                      child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Eventtile(),
                      Eventtile(),
                      Eventtile(),
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: width,
                    height: height * 0.07,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Createnewevent()),
                          );
                        },
                        child: Text(
                          "Create a new event",
                          style: TextStyle(fontSize: width * 0.07),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
