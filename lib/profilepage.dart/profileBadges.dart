import 'package:demo2/profilepage.dart/profilepagenavigator.dart';
import 'package:flutter/material.dart';
import 'package:demo2/colors.dart';

class Profilebadges extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileBadgesChild();
  }
}

class ProfileBadgesChild extends State<Profilebadges> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Center(
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
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: height * 0.04,
                ),
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth > 500.0) {
                    return new CircleAvatar(
                      backgroundImage: AssetImage('assets/girlportrait.jpeg'),
                      radius: width * 0.16,
                    );
                  } else if (constraints.maxWidth < 320) {
                    return new CircleAvatar(
                      backgroundImage: AssetImage('assets/girlportrait.jpeg'),
                      radius: width * 0.15,
                    );
                  } else {
                    return new CircleAvatar(
                      backgroundImage: AssetImage('assets/girlportrait.jpeg'),
                      radius: width * 0.22,
                    );
                  }
                }),
                SizedBox(
                  height: height * 0.018,
                ),
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth > 500.0) {
                    return new Text(
                      "Alessandra Lauren",
                      style: TextStyle(color: logoColor, fontSize: 45),
                    );
                  } else {
                    return new Text(
                      "Alessandra Lauren",
                      style: TextStyle(color: logoColor, fontSize: 30),
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
                          image: AssetImage("assets/gradientredblue.png"),
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
        new ProfilePageNavigator()
      ],
    ));
  }
}
