import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';

class Bloodmain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BloodmainChild();
  }
}

class BloodmainChild extends State<Bloodmain> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                      child: Text(
                    "Be the reason for someone’s heartbeat",
                    style: TextStyle(fontSize: width * 0.07),
                    textAlign: TextAlign.center,
                  )),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  width: width,
                  color: Colors.red,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Urgent requests",
                          style: TextStyle(
                              fontSize: width * 0.07, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "view all",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width,
                  height: height * 0.3,
                  child: Expanded(
                      child: ListView(
                    children: <Widget>[
                      Bloodtiles(),
                      Bloodtiles(),
                      Bloodtiles(),
                    ],
                  )),
                ),
                ///////////////////////////////////////////////////////////////
                Container(
                  width: width,
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Non Urgent requests",
                          style: TextStyle(
                              fontSize: width * 0.07, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "view all",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width,
                  height: height * 0.3,
                  child: Expanded(
                      child: ListView(
                    children: <Widget>[
                      Bloodtiles(),
                      Bloodtiles(),
                      Bloodtiles(),
                    ],
                  )),
                ),

                Container(
                    width: width,
                    height: height * 0.06,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Requestblood()),
                          );
                        },
                        child: Text(
                          "Request Blood",
                          style: TextStyle(fontSize: width * 0.08),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
