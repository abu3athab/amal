import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charityitemlist.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';

class Charitypage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CharitypageChild();
  }
}

class CharitypageChild extends State<Charitypage> {
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
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: width,
                    height: height * 0.21,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/flat-illustration-world-humanitarian-day_23-2149484207 (1).png"),
                          fit: BoxFit.cover,
                          opacity: 0.4),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Tikyat Um Ali",
                          style: TextStyle(fontSize: width * 0.08),
                        ),
                        Text(
                          "Tikyat Um Ali main goal is to provide help to every indivual and family in need so everyone can enjoy a full life without worrying about basic needs",
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                        Spacer(),
                        Row(children: [
                          Text(
                            "location: Amman, Jordan",
                            style: TextStyle(fontSize: width * 0.05),
                          ),
                          Spacer(),
                          TextButton(onPressed: () {}, child: Text("view info"))
                        ]),
                      ],
                    )),
                //////////////////////////////
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sidemenu()),
                                );
                              },
                            )),
                        Spacer(),
                        Container(
                          width: width * 0.7,
                          child: TextField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1)),
                              hintText: 'Try Food.clothing...',
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
                            child: InkWell(
                              child: Image.asset("assets/magnifying-glass.gif"),
                              onTap: () {},
                            )),
                      ],
                    )),
                Expanded(
                    child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    // Charityitems(),
                    // Charityitems(),
                    // Charityitems(),
                    // Charityitems(),
                    // Charityitems(),
                    // Charityitems(),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
