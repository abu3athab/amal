import 'dart:math';

import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/profilepage.dart/profilepagenavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../log in/logIn.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileChild();
  }
}

class ProfileChild extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _editProfileKey = GlobalKey<FormState>();

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gradientredblue.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: width * 0.04,
              ),
              new ProfileView(),
              SizedBox(
                width: width * 0.04,
              ),
              //////////////////////////////////2222222//////////////////////
              /////////////////////////////////////2222222///////////////////
              /////////////////////////////////////2222222///////////////////
              /////////////////////////////////////2222222///////////////////
              /////////////////////////////////////2222222///////////////////
              /////////////////////////////////////2222222///////////////////
              /////////////////////////////////////2222222///////////////////
              new Profilebadges(),
              SizedBox(
                width: width * 0.04,
              ),
              ///////////////////////////33333///////////////////////
              //////////////////////////////33333////////////////////
              //////////////////////////////33333////////////////////
              //////////////////////////////33333////////////////////
              //////////////////////////////33333////////////////////
              //////////////////////////////33333////////////////////
              //////////////////////////////33333////////////////////

              // Center(
              //     child: Column(
              //   children: [
              //     SizedBox(
              //       height: height * 0.08,
              //     ),
              //     Text(
              //       "Edit Profile",
              //       style: TextStyle(fontSize: 30, color: Colors.white),
              //     ),
              //     Container(
              //       width: width * 0.92,
              //       height: height * 0.65,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       padding: new EdgeInsets.all(10.0),
              //       child: Card(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(15.0),
              //         ),
              //         color: Colors.white,
              //         elevation: 10,
              //         child: SingleChildScrollView(
              //           child: Column(
              //               mainAxisSize: MainAxisSize.min,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Container(
              //                     padding: EdgeInsets.all(width * 0.05),
              //                     child: Form(
              //                       key: _editProfileKey,
              //                       child: Column(
              //                         children: [
              //                           Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.center,
              //                             children: [
              //                               Flexible(
              //                                 child: Text("Upload new image",
              //                                     textAlign: TextAlign.center,
              //                                     style: new TextStyle(
              //                                         fontSize: 20.0,
              //                                         foreground: Paint()
              //                                           ..shader =
              //                                               LinearGradient(
              //                                             colors: <Color>[
              //                                               Colors.pinkAccent,
              //                                               Colors
              //                                                   .deepPurpleAccent,
              //                                               logoColorsec
              //                                               //add more color here.
              //                                             ],
              //                                           ).createShader(
              //                                                   Rect.fromLTWH(
              //                                                       220.0,
              //                                                       200.0,
              //                                                       200.0,
              //                                                       150.0)))),
              //                               ),
              //                               IconButton(
              //                                 iconSize: height * 0.04,
              //                                 icon:
              //                                     const Icon(Icons.add_a_photo),
              //                                 onPressed: () {
              //                                   setState(() {});
              //                                 },
              //                               ),
              //                             ],
              //                           ),
              //                           Container(
              //                             width: width * 0.8,
              //                             height: 2,
              //                             color: logoColorsec,
              //                           ),
              //                           SizedBox(
              //                             height: height * 0.01,
              //                           ),
              //                           TextFormField(
              //                             textAlign: TextAlign.center,
              //                             decoration: InputDecoration(
              //                                 hintText: "Name",
              //                                 hintStyle: TextStyle(
              //                                     foreground: Paint()
              //                                       ..shader = LinearGradient(
              //                                         colors: <Color>[
              //                                           Colors.pinkAccent,
              //                                           Colors.deepPurpleAccent,
              //                                           logoColorsec
              //                                           //add more color here.
              //                                         ],
              //                                       ).createShader(
              //                                           Rect.fromLTWH(
              //                                               220.0,
              //                                               200.0,
              //                                               200.0,
              //                                               150.0)))),
              //                           ),
              //                           TextFormField(
              //                             textAlign: TextAlign.center,
              //                             decoration: InputDecoration(
              //                                 hintText: "Username",
              //                                 hintStyle: TextStyle(
              //                                     foreground: Paint()
              //                                       ..shader = LinearGradient(
              //                                         colors: <Color>[
              //                                           Colors.pinkAccent,
              //                                           Colors.deepPurpleAccent,
              //                                           logoColorsec
              //                                           //add more color here.
              //                                         ],
              //                                       ).createShader(
              //                                           Rect.fromLTWH(
              //                                               220.0,
              //                                               200.0,
              //                                               200.0,
              //                                               150.0)))),
              //                           ),
              //                           TextFormField(
              //                             textAlign: TextAlign.center,
              //                             decoration: InputDecoration(
              //                                 hintText: "City",
              //                                 hintStyle: TextStyle(
              //                                     foreground: Paint()
              //                                       ..shader = LinearGradient(
              //                                         colors: <Color>[
              //                                           Colors.pinkAccent,
              //                                           Colors.deepPurpleAccent,
              //                                           logoColorsec
              //                                           //add more color here.
              //                                         ],
              //                                       ).createShader(
              //                                           Rect.fromLTWH(
              //                                               220.0,
              //                                               200.0,
              //                                               200.0,
              //                                               150.0)))),
              //                           ),
              //                           TextFormField(
              //                             textAlign: TextAlign.center,
              //                             decoration: InputDecoration(
              //                                 hintText: "Country",
              //                                 hintStyle: TextStyle(
              //                                     foreground: Paint()
              //                                       ..shader = LinearGradient(
              //                                         colors: <Color>[
              //                                           Colors.pinkAccent,
              //                                           Colors.deepPurpleAccent,
              //                                           logoColorsec
              //                                           //add more color here.
              //                                         ],
              //                                       ).createShader(
              //                                           Rect.fromLTWH(
              //                                               220.0,
              //                                               200.0,
              //                                               200.0,
              //                                               150.0)))),
              //                           ),
              //                           TextFormField(
              //                             textAlign: TextAlign.center,
              //                             decoration: InputDecoration(
              //                                 hintText: "Bio",
              //                                 hintStyle: TextStyle(
              //                                     foreground: Paint()
              //                                       ..shader = LinearGradient(
              //                                         colors: <Color>[
              //                                           Colors.pinkAccent,
              //                                           Colors.deepPurpleAccent,
              //                                           logoColorsec
              //                                           //add more color here.
              //                                         ],
              //                                       ).createShader(
              //                                           Rect.fromLTWH(
              //                                               220.0,
              //                                               200.0,
              //                                               200.0,
              //                                               150.0)))),
              //                           ),
              //                           TextFormField(
              //                             textAlign: TextAlign.center,
              //                             decoration: InputDecoration(
              //                                 hintText: "Phone Number"),
              //                             style: TextStyle(
              //                                 foreground: Paint()
              //                                   ..shader = LinearGradient(
              //                                     colors: <Color>[
              //                                       Colors.pinkAccent,
              //                                       Colors.deepPurpleAccent,
              //                                       logoColorsec
              //                                       //add more color here.
              //                                     ],
              //                                   ).createShader(Rect.fromLTWH(
              //                                       220.0,
              //                                       200.0,
              //                                       200.0,
              //                                       150.0))),
              //                           ),
              //                           SizedBox(
              //                             height: height * 0.1,
              //                           ),
              //                           Container(
              //                             width: width * 0.6,
              //                             height: height * 0.07,
              //                             child: ElevatedButton(
              //                               onPressed: () {},
              //                               child: Text(
              //                                 "Update",
              //                                 style: TextStyle(
              //                                     color: Colors.white,
              //                                     fontSize: 18),
              //                               ),
              //                               style: ButtonStyle(
              //                                   shape: MaterialStateProperty
              //                                       .all(RoundedRectangleBorder(
              //                                           borderRadius:
              //                                               BorderRadius
              //                                                   .circular(50))),
              //                                   backgroundColor:
              //                                       MaterialStateProperty.all(
              //                                           logoColor)),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     )),
              //               ]),
              //         ),
              //       ),
              //     ),
              //   ],
              // )),
              SizedBox(
                width: width * 0.04,
              )
            ],
          ),
        ),
      ),
    );
  }
}
