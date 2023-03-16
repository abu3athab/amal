import 'dart:math';

import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
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
              Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Text(
                    "My Profile",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Container(
                    width: width * 0.92,
                    height: height * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: new EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: SingleChildScrollView(
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            if (constraints.maxWidth > 500.0) {
                              return new CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/girlportrait.jpeg'),
                                radius: width * 0.16,
                              );
                            } else if (constraints.maxWidth < 320) {
                              return new CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/girlportrait.jpeg'),
                                radius: width * 0.15,
                              );
                            } else {
                              return new CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/girlportrait.jpeg'),
                                radius: width * 0.22,
                              );
                            }
                          }),
                          SizedBox(
                            height: height * 0.018,
                          ),
                          LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            if (constraints.maxWidth > 500.0) {
                              return new Text(
                                "Alessandra Lauren",
                                style:
                                    TextStyle(color: logoColor, fontSize: 45),
                              );
                            } else {
                              return new Text(
                                "Alessandra Lauren",
                                style:
                                    TextStyle(color: logoColor, fontSize: 30),
                              );
                            }
                          }),
                          SizedBox(
                            height: height * 0.008,
                          ),
                          LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            if (constraints.maxWidth > 500.0) {
                              return new Text(
                                'AMMAN, JORDAN',
                                style: TextStyle(fontSize: 22),
                              );
                            } else {
                              return new Text('AMMAN, JORDAN');
                            }
                          }),
                          SizedBox(
                            height: height * 0.008,
                          ),
                          SizedBox(
                            height: height * 0.008,
                          ),
                          LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            if (constraints.maxWidth > 500.0) {
                              return Container(
                                width: width * 0.75,
                                child: new Flexible(
                                  child: Text(
                                      "I live in the sunshine where I belong, Sprinkling kindness everywhere I go.",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontSize: 25.0,
                                          foreground: Paint()
                                            ..shader = LinearGradient(
                                              colors: <Color>[
                                                Colors.pinkAccent,
                                                Colors.deepPurpleAccent,
                                                logoColorsec
                                                //add more color here.
                                              ],
                                            ).createShader(Rect.fromLTWH(
                                                220.0, 200.0, 200.0, 150.0)))),
                                ),
                              );
                            } else {
                              return Container(
                                width: width * 0.75,
                                child: new Flexible(
                                  child: Text(
                                      "I live in the sunshine where I belong, Sprinkling kindness everywhere I go.",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontSize: 15.0,
                                          foreground: Paint()
                                            ..shader = LinearGradient(
                                              colors: <Color>[
                                                Colors.pinkAccent,
                                                Colors.deepPurpleAccent,
                                                logoColorsec
                                                //add more color here.
                                              ],
                                            ).createShader(Rect.fromLTWH(
                                                50.0, 0.0, 200.0, 100.0)))),
                                ),
                              );
                            }
                          }),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            width: width * 0.7,
                            height: 2,
                            color: logoColorsec,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            width: width * 0.7,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Username:",
                                      style: TextStyle(
                                          color: logoColorsec,
                                          fontSize: width * 0.03),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Alessandra.Love1710",
                                      style: TextStyle(
                                          color: logoColorsec,
                                          fontSize: width * 0.03),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email:",
                                      style: TextStyle(
                                          color: logoColorsec,
                                          fontSize: width * 0.03),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Alessandra_Lauren@gmail.com",
                                      style: TextStyle(
                                          color: logoColorsec,
                                          fontSize: width * 0.03),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone Number:",
                                      style: TextStyle(
                                          color: logoColorsec,
                                          fontSize: width * 0.03),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "0790741003",
                                      style: TextStyle(
                                          color: logoColorsec,
                                          fontSize: width * 0.03),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gender:",
                                      style: TextStyle(
                                          color: logoColorsec,
                                          fontSize: width * 0.03),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(
                                          color: logoColorsec,
                                          fontSize: width * 0.03),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date of Birth:",
                                      style: TextStyle(
                                          color: logoColorsec,
                                          fontSize: width * 0.03),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Oct/17/2000",
                                      style: TextStyle(
                                          color: logoColorsec,
                                          fontSize: width * 0.03),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.65,
                    height: height * 0.1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                            child: IconButton(
                              iconSize: height * 0.04,
                              icon: const Icon(Icons.volunteer_activism),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          )),
                          VerticalDivider(width: 1.0),
                          Expanded(
                              child: Center(
                            child: IconButton(
                              iconSize: height * 0.04,
                              icon: const Icon(Icons.account_circle),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          )),
                          VerticalDivider(width: 1.0),
                          Expanded(
                              child: Center(
                            child: IconButton(
                              iconSize: height * 0.04,
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
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
              Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Text(
                    "Achievement",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Container(
                    width: width * 0.92,
                    height: height * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: new EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: SingleChildScrollView(
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            if (constraints.maxWidth > 500.0) {
                              return new CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/girlportrait.jpeg'),
                                radius: width * 0.16,
                              );
                            } else if (constraints.maxWidth < 320) {
                              return new CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/girlportrait.jpeg'),
                                radius: width * 0.15,
                              );
                            } else {
                              return new CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/girlportrait.jpeg'),
                                radius: width * 0.22,
                              );
                            }
                          }),
                          SizedBox(
                            height: height * 0.018,
                          ),
                          LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            if (constraints.maxWidth > 500.0) {
                              return new Text(
                                "Alessandra Lauren",
                                style:
                                    TextStyle(color: logoColor, fontSize: 45),
                              );
                            } else {
                              return new Text(
                                "Alessandra Lauren",
                                style:
                                    TextStyle(color: logoColor, fontSize: 30),
                              );
                            }
                          }),
                          SizedBox(
                            height: height * 0.008,
                          ),
                          Container(
                            width: width * 0.7,
                            height: 2,
                            color: logoColorsec,
                          ),
                          SizedBox(
                            height: height * 0.016,
                          ),
                          Text(
                            "Badges",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            height: height * 0.016,
                          ),
                          Container(
                            width: width * 0.75,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/gradientredblue.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15),
                                color: logoColor),
                            padding: EdgeInsets.all(5),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Center(
                                        child: IconButton(
                                          iconSize: height * 0.04,
                                          color: Colors.white,
                                          icon: const Icon(Icons.favorite),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                      )),
                                      VerticalDivider(
                                        width: 1.0,
                                        color: Colors.white,
                                      ),
                                      Expanded(
                                          child: Center(
                                        child: IconButton(
                                          iconSize: height * 0.04,
                                          color: Colors.white,
                                          icon: const Icon(Icons.favorite),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                      )),
                                      VerticalDivider(width: 1.0),
                                      Expanded(
                                          child: Center(
                                        child: IconButton(
                                          iconSize: height * 0.04,
                                          color: Colors.white,
                                          icon: const Icon(Icons.favorite),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Center(
                                        child: IconButton(
                                          iconSize: height * 0.04,
                                          color: Colors.white,
                                          icon: const Icon(Icons.favorite),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                      )),
                                      VerticalDivider(
                                        width: 1.0,
                                        color: Colors.white,
                                      ),
                                      Expanded(
                                          child: Center(
                                        child: IconButton(
                                          iconSize: height * 0.04,
                                          color: Colors.white,
                                          icon: const Icon(Icons.favorite),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                      )),
                                      VerticalDivider(width: 1.0),
                                      Expanded(
                                          child: Center(
                                        child: IconButton(
                                          iconSize: height * 0.04,
                                          color: Colors.white,
                                          icon: const Icon(Icons.favorite),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Center(
                                        child: IconButton(
                                          iconSize: height * 0.04,
                                          color: Colors.white,
                                          icon: const Icon(Icons.favorite),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                      )),
                                      VerticalDivider(
                                        width: 1.0,
                                        color: Colors.white,
                                      ),
                                      Expanded(
                                          child: Center(
                                        child: IconButton(
                                          iconSize: height * 0.04,
                                          color: Colors.white,
                                          icon: const Icon(Icons.favorite),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                      )),
                                      VerticalDivider(width: 1.0),
                                      Expanded(
                                          child: Center(
                                        child: IconButton(
                                          iconSize: height * 0.04,
                                          color: Colors.white,
                                          icon: const Icon(Icons.favorite),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.65,
                    height: height * 0.1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                            child: IconButton(
                              iconSize: height * 0.04,
                              icon: const Icon(Icons.volunteer_activism),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          )),
                          VerticalDivider(width: 1.0),
                          Expanded(
                              child: Center(
                            child: IconButton(
                              iconSize: height * 0.04,
                              icon: const Icon(Icons.account_circle),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          )),
                          VerticalDivider(width: 1.0),
                          Expanded(
                              child: Center(
                            child: IconButton(
                              iconSize: height * 0.04,
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
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

              Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Container(
                    width: width * 0.92,
                    height: height * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: new EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(width * 0.05),
                                  child: Form(
                                    key: _editProfileKey,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Text("Upload new image",
                                                  textAlign: TextAlign.center,
                                                  style: new TextStyle(
                                                      fontSize: 20.0,
                                                      foreground: Paint()
                                                        ..shader =
                                                            LinearGradient(
                                                          colors: <Color>[
                                                            Colors.pinkAccent,
                                                            Colors
                                                                .deepPurpleAccent,
                                                            logoColorsec
                                                            //add more color here.
                                                          ],
                                                        ).createShader(
                                                                Rect.fromLTWH(
                                                                    220.0,
                                                                    200.0,
                                                                    200.0,
                                                                    150.0)))),
                                            ),
                                            IconButton(
                                              iconSize: height * 0.04,
                                              icon:
                                                  const Icon(Icons.add_a_photo),
                                              onPressed: () {
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: width * 0.8,
                                          height: 2,
                                          color: logoColorsec,
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        TextFormField(
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              hintText: "Name",
                                              hintStyle: TextStyle(
                                                  foreground: Paint()
                                                    ..shader = LinearGradient(
                                                      colors: <Color>[
                                                        Colors.pinkAccent,
                                                        Colors.deepPurpleAccent,
                                                        logoColorsec
                                                        //add more color here.
                                                      ],
                                                    ).createShader(
                                                        Rect.fromLTWH(
                                                            220.0,
                                                            200.0,
                                                            200.0,
                                                            150.0)))),
                                        ),
                                        TextFormField(
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              hintText: "Username",
                                              hintStyle: TextStyle(
                                                  foreground: Paint()
                                                    ..shader = LinearGradient(
                                                      colors: <Color>[
                                                        Colors.pinkAccent,
                                                        Colors.deepPurpleAccent,
                                                        logoColorsec
                                                        //add more color here.
                                                      ],
                                                    ).createShader(
                                                        Rect.fromLTWH(
                                                            220.0,
                                                            200.0,
                                                            200.0,
                                                            150.0)))),
                                        ),
                                        TextFormField(
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              hintText: "City",
                                              hintStyle: TextStyle(
                                                  foreground: Paint()
                                                    ..shader = LinearGradient(
                                                      colors: <Color>[
                                                        Colors.pinkAccent,
                                                        Colors.deepPurpleAccent,
                                                        logoColorsec
                                                        //add more color here.
                                                      ],
                                                    ).createShader(
                                                        Rect.fromLTWH(
                                                            220.0,
                                                            200.0,
                                                            200.0,
                                                            150.0)))),
                                        ),
                                        TextFormField(
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              hintText: "Country",
                                              hintStyle: TextStyle(
                                                  foreground: Paint()
                                                    ..shader = LinearGradient(
                                                      colors: <Color>[
                                                        Colors.pinkAccent,
                                                        Colors.deepPurpleAccent,
                                                        logoColorsec
                                                        //add more color here.
                                                      ],
                                                    ).createShader(
                                                        Rect.fromLTWH(
                                                            220.0,
                                                            200.0,
                                                            200.0,
                                                            150.0)))),
                                        ),
                                        TextFormField(
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              hintText: "Bio",
                                              hintStyle: TextStyle(
                                                  foreground: Paint()
                                                    ..shader = LinearGradient(
                                                      colors: <Color>[
                                                        Colors.pinkAccent,
                                                        Colors.deepPurpleAccent,
                                                        logoColorsec
                                                        //add more color here.
                                                      ],
                                                    ).createShader(
                                                        Rect.fromLTWH(
                                                            220.0,
                                                            200.0,
                                                            200.0,
                                                            150.0)))),
                                        ),
                                        TextFormField(
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              hintText: "Phone Number"),
                                          style: TextStyle(
                                              foreground: Paint()
                                                ..shader = LinearGradient(
                                                  colors: <Color>[
                                                    Colors.pinkAccent,
                                                    Colors.deepPurpleAccent,
                                                    logoColorsec
                                                    //add more color here.
                                                  ],
                                                ).createShader(Rect.fromLTWH(
                                                    220.0,
                                                    200.0,
                                                    200.0,
                                                    150.0))),
                                        ),
                                        SizedBox(
                                          height: height * 0.1,
                                        ),
                                        Container(
                                          width: width * 0.6,
                                          height: height * 0.07,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Update",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50))),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        logoColor)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ]),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.65,
                    height: height * 0.1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                            child: IconButton(
                              iconSize: height * 0.04,
                              icon: const Icon(Icons.volunteer_activism),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          )),
                          VerticalDivider(width: 1.0),
                          Expanded(
                              child: Center(
                            child: IconButton(
                              iconSize: height * 0.04,
                              icon: const Icon(Icons.account_circle),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          )),
                          VerticalDivider(width: 1.0),
                          Expanded(
                              child: Center(
                            child: IconButton(
                              iconSize: height * 0.04,
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
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
