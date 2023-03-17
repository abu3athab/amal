import 'package:flutter/material.dart';
import 'profilepagenavigator.dart';
import 'package:demo2/colors.dart';

class ProfileView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileViewChild();
  }
}

class ProfileViewChild extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
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
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
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
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
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
                                  ).createShader(
                                      Rect.fromLTWH(50.0, 0.0, 200.0, 100.0)))),
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
                                color: logoColorsec, fontSize: width * 0.03),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Alessandra.Love1710",
                            style: TextStyle(
                                color: logoColorsec, fontSize: width * 0.03),
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
                                color: logoColorsec, fontSize: width * 0.03),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Alessandra_Lauren@gmail.com",
                            style: TextStyle(
                                color: logoColorsec, fontSize: width * 0.03),
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
                                color: logoColorsec, fontSize: width * 0.03),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "0790741003",
                            style: TextStyle(
                                color: logoColorsec, fontSize: width * 0.03),
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
                                color: logoColorsec, fontSize: width * 0.03),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                color: logoColorsec, fontSize: width * 0.03),
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
                                color: logoColorsec, fontSize: width * 0.03),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Oct/17/2000",
                            style: TextStyle(
                                color: logoColorsec, fontSize: width * 0.03),
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
        new ProfilePageNavigator()
      ],
    ));
  }
}
