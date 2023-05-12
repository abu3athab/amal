import 'dart:ffi';

import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';

import 'package:demo2/colors.dart';
import 'package:demo2/profilepage.dart/profile.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/volunteermain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageChild();
  }
}

class MainPageChild extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var availableHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white])),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    height: availableHeight * 0.21,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(children: [
                      SizedBox(height: availableHeight * .02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi, Alessandra",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.06),
                                ),
                                Text(
                                  "Let's start spreading goodness",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.04),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sidemenu()),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/girlportrait.jpeg'),
                              radius: height * 0.04,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: availableHeight * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(0, 0, 0, 0.1)),
                        padding: EdgeInsets.all(7),
                        width: width,
                        height: height * 0.07,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.01,
                              height: 2,
                            ),
                            Container(
                              width: width * 0.7,
                              child: TextField(
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1)),
                                  hintText: 'Try Food,Clothes..',
                                ),
                                style: TextStyle(fontSize: height * 0.021),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: IconButton(
                                iconSize: width * 0.07,
                                icon: const Icon(Icons.search),
                                onPressed: () {
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 15),
                    width: width,
                    height: availableHeight * 0.655,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Catagories",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            width: width * 0.95,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.001,
                                ),
                                InkWell(
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/charityPic.png'),
                                        radius: width * 0.10,
                                      ),
                                      Text(
                                        "Charity",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/illustration-person-donating-blood_23-2148236971.jpg'),
                                        radius: width * 0.10,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Bloodmain()),
                                        );
                                      },
                                    ),
                                    Text(
                                      "Blood donation",
                                      style: TextStyle(
                                          fontSize: width * 0.04,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Vounteermain()),
                                        );
                                      },
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/Community-Donation-Drive-Feature-Image-01.webp'),
                                        radius: width * 0.1,
                                      ),
                                    ),
                                    //added
                                    Text(
                                      "Volunteer",
                                      style: TextStyle(
                                          fontSize: width * 0.04,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: width * 0.001,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.001,
                            height: 10,
                          ),
                          Container(
                            width: width * 0.9,
                            height: 1,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: width * 0.001,
                            height: 10,
                          ),
                          Container(
                            width: width,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Featured Charities",
                                        style: TextStyle(
                                            fontSize: width * 0.05,
                                            color: Colors.black)),
                                  ),
                                ),
                                //CHAIRTY CARD//////////////////
                                Container(
                                  width: width * 0.95,
                                  height: height * 0.18,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.white,
                                    elevation: 10,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(7.5),
                                          child: Image.asset(
                                              "assets/drawn-clothing-donation-concept-illustrated_23-2148833206.png"),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tekyat um Ali",
                                              style: TextStyle(
                                                  fontSize: width * 0.05),
                                            ),
                                            SizedBox(
                                              height: height * 0.005,
                                            ),
                                            Text(
                                              "Donation type : food,clothes,supplies ",
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Container(
                                              width: width * 0.5,
                                              child: Expanded(
                                                child: Text(
                                                  "description : we provide the neccesarry things to the people who cant afford it",
                                                  style: TextStyle(
                                                      fontSize: height * 0.015),
                                                  softWrap: true,
                                                  maxLines: 6,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Text(
                                              "Location : Amman/Jordan",
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                //CHAIRTY CARD//////////////////
                                Container(
                                  width: width * 0.95,
                                  height: height * 0.18,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.white,
                                    elevation: 10,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(7.5),
                                          child: Image.asset(
                                              "assets/drawn-clothing-donation-concept-illustrated_23-2148833206.png"),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tekyat um Ali",
                                              style: TextStyle(
                                                  fontSize: width * 0.05),
                                            ),
                                            SizedBox(
                                              height: height * 0.005,
                                            ),
                                            Text(
                                              "Donation type : food,clothes,supplies ",
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Container(
                                              width: width * 0.5,
                                              child: Expanded(
                                                child: Text(
                                                  "description : we provide the neccesarry things to the people who cant afford it",
                                                  style: TextStyle(
                                                      fontSize: height * 0.015),
                                                  softWrap: true,
                                                  maxLines: 6,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Text(
                                              "Location : Amman/Jordan",
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width * 0.95,
                                  height: height * 0.18,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.white,
                                    elevation: 10,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(7.5),
                                          child: Image.asset(
                                              "assets/drawn-clothing-donation-concept-illustrated_23-2148833206.png"),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tekyat um Ali",
                                              style: TextStyle(
                                                  fontSize: width * 0.05),
                                            ),
                                            SizedBox(
                                              height: height * 0.005,
                                            ),
                                            Text(
                                              "Donation type : food,clothes,supplies ",
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Container(
                                              width: width * 0.5,
                                              child: Expanded(
                                                child: Text(
                                                  "description : we provide the neccesarry things to the people who cant afford it",
                                                  style: TextStyle(
                                                      fontSize: height * 0.015),
                                                  softWrap: true,
                                                  maxLines: 6,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Text(
                                              "Location : Amman/Jordan",
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width * 0.95,
                                  height: height * 0.18,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.white,
                                    elevation: 10,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(7.5),
                                          child: Image.asset(
                                              "assets/drawn-clothing-donation-concept-illustrated_23-2148833206.png"),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tekyat um Ali",
                                              style: TextStyle(
                                                  fontSize: width * 0.05),
                                            ),
                                            SizedBox(
                                              height: height * 0.005,
                                            ),
                                            Text(
                                              "Donation type : food,clothes,supplies ",
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Container(
                                              width: width * 0.5,
                                              child: Expanded(
                                                child: Text(
                                                  "description : we provide the neccesarry things to the people who cant afford it",
                                                  style: TextStyle(
                                                      fontSize: height * 0.015),
                                                  softWrap: true,
                                                  maxLines: 6,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Text(
                                              "Location : Amman/Jordan",
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
