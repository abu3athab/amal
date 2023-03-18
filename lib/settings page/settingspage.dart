import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Settingschild();
  }
}

class Settingschild extends State<Settings> {
  double generalvis = 1;
  double notificationvis = 0.5;
  double generalboxvis = 1;
  double notificationboxvis = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gradientredblue.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.07,
              ),
              //start of setting title bar/////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.rotate(
                          angle: 90 * math.pi / 180,
                          child: Icon(
                            Icons.bar_chart,
                            color: Colors.white,
                            size: height * 0.03,
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(width: 1.0),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "SETTINGS ",
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.05),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(width: 1.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Transform.rotate(
                          angle: 270 * math.pi / 180,
                          child: Icon(
                            Icons.bar_chart,
                            color: Colors.white,
                            size: height * 0.03,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              //start of general/notification row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: AnimatedOpacity(
                        opacity: generalvis,
                        duration: const Duration(milliseconds: 500),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                generalvis = 1.0;
                                notificationvis = 0.5;
                                generalboxvis = 1;
                                notificationboxvis = 0;
                              });
                            },
                            child: Text(
                              "GENERAL",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.045),
                            )),
                      ),
                    ),
                  ),
                  VerticalDivider(width: 1.0),
                  Center(
                    child: Text(
                      "/",
                      style: TextStyle(
                          color: Colors.white, fontSize: width * 0.08),
                    ),
                  ),
                  VerticalDivider(width: 1.0),
                  Expanded(
                    child: Center(
                      child: AnimatedOpacity(
                        opacity: notificationvis,
                        duration: const Duration(milliseconds: 500),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                generalvis = 0.5;
                                notificationvis = 1.0;
                                generalboxvis = 0;
                                notificationboxvis = 1;
                              });
                            },
                            child: Text(
                              "NOTIFICATION",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.045),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.0535,
              ),
              //end of general/notification row///////////////////////

              Container(
                  width: width * 0.9,
                  height: height * 0.65,
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            width: width * 0.8,
                            height: height * 0.6,
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        ),
                        //general container
                        Opacity(
                          opacity: generalboxvis,
                          child: Container(
                            width: width * 0.7,
                            height: height * 0.5,
                            padding: EdgeInsets.all(height * 0.015),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Enable Dark Mode",
                                      style: TextStyle(fontSize: width * 0.05),
                                    ),
                                    SizedBox(
                                      width: width * 0.15,
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
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.account_circle,
                                    size: height * 0.05,
                                    color: logoColor,
                                  ),
                                  label: Text(
                                    'Edit profile',
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        color: logoColor),
                                  ), // <-- Text
                                ),
                                Container(
                                  width: width * 0.65,
                                  color: Colors.grey,
                                  height: height * 0.001,
                                ),
                                ///////////////////////
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.email,
                                    color: logoColor,
                                    size: height * 0.05,
                                  ),
                                  label: Text(
                                    'Edit email',
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        color: logoColor),
                                  ), // <-- Text
                                ),
                                Container(
                                  width: width * 0.65,
                                  color: Colors.grey,
                                  height: height * 0.001,
                                ),
                                /////////////////////////
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    color: logoColor,
                                    Icons.lock,
                                    size: height * 0.05,
                                  ),
                                  label: Text(
                                    'Edit password',
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        color: logoColor),
                                  ), // <-- Text
                                ),
                                Container(
                                  width: width * 0.65,
                                  color: Colors.grey,
                                  height: height * 0.001,
                                ),
                                /////////////////////////
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    color: logoColor,
                                    Icons.language,
                                    size: height * 0.05,
                                  ),
                                  label: Text(
                                    'Edit language',
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        color: logoColor),
                                  ), // <-- Text
                                ),
                                Container(
                                  width: width * 0.65,
                                  color: Colors.grey,
                                  height: height * 0.001,
                                ),
                                ///////////////////////////////
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    color: logoColor,
                                    Icons.logout,
                                    size: height * 0.05,
                                  ),
                                  label: Text(
                                    'Log out',
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        color: logoColor),
                                  ), // <-- Text
                                ),
                              ],
                            ),
                          ),
                        ),
                        //general container

                        //notification container
                        Opacity(
                          opacity: notificationboxvis,
                          child: Container(
                            width: width * 0.7,
                            height: height * 0.5,
                            padding: EdgeInsets.all(height * 0.015),
                            color: Colors.white,
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Allow Notifications",
                                      style: TextStyle(fontSize: width * 0.05),
                                    ),
                                    SizedBox(
                                      width: width * 0.15,
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

                                ////
                                Container(
                                  width: width * 0.65,
                                  color: Colors.grey,
                                  height: height * 0.001,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * 0.45,
                                      child: Text(
                                        "Allow urgent blood request notifications",
                                        style:
                                            TextStyle(fontSize: width * 0.05),
                                        maxLines: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.15,
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
                                  height: height * 0.01,
                                ),
                                Container(
                                  width: width * 0.65,
                                  color: Colors.grey,
                                  height: height * 0.001,
                                ),
                                ////////

                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * 0.45,
                                      child: Text(
                                        "Allow volunteer event reminder notification",
                                        style:
                                            TextStyle(fontSize: width * 0.05),
                                        maxLines: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.15,
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
                                  height: height * 0.01,
                                ),
                                Container(
                                  width: width * 0.65,
                                  color: Colors.grey,
                                  height: height * 0.001,
                                ),
                                ///////////
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * 0.45,
                                      child: Text(
                                        "Allow motivitional quote notification",
                                        style:
                                            TextStyle(fontSize: width * 0.05),
                                        maxLines: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.15,
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
                                  height: height * 0.01,
                                ),
                                Container(
                                  width: width * 0.65,
                                  color: Colors.grey,
                                  height: height * 0.001,
                                ),
                              ]),
                            ),
                          ),
                        ),
                        //notification container
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
