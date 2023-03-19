import 'dart:ffi';

import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/profilepage.dart/profile.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height * 0.29,
              color: logoColorsec,
              padding: EdgeInsets.all(10),
              child: Column(children: [
                SizedBox(height: height * .06),
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
                                color: Colors.white, fontSize: width * 0.06),
                          ),
                          Text(
                            "Let's start spreading goodness",
                            style: TextStyle(
                                color: Colors.grey, fontSize: width * 0.04),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/girlportrait.jpeg'),
                      radius: height * 0.04,
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(255, 255, 255, 0.15)),
                  padding: EdgeInsets.all(7),
                  width: width,
                  height: height * 0.09,
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
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                            hintText: 'Try Food,Clothes..',
                          ),
                          style: TextStyle(fontSize: height * 0.035),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
              padding: EdgeInsets.fromLTRB(5, 10, 5, 15),
              width: width,
              height: height * 0.6,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.001,
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/charityPic.png'),
                                radius: width * 0.13,
                              ),
                              Text(
                                "Charity",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/illustration-person-donating-blood_23-2148236971.jpg'),
                                radius: width * 0.13,
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
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/Community-Donation-Drive-Feature-Image-01.webp'),
                                radius: width * 0.13,
                              ),
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
