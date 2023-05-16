import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';

class Vounteermain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VounteermainChild();
  }
}

class VounteermainChild extends State<Vounteermain> {
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
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      iconSize: width * 0.06,
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    "You make a living by what you get. You make a life by what you give.",
                    style: TextStyle(fontSize: width * 0.07),
                  ),
                ),
                Row(
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
                        style: TextStyle(fontSize: height * 0.021),
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
                SizedBox(
                  height: height * 0.02,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Manageevents()),
                      );
                    },
                    child: Text(
                      "manage your events",
                      style: TextStyle(fontSize: width * 0.06),
                    )),
                Divider(
                  thickness: 2,
                ),
                Row(
                  children: [
                    Text("Events in amman"),
                    Spacer(),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {}, child: Text("Change city")),
                        TextButton(onPressed: () {}, child: Text("See all"))
                      ],
                    )
                  ],
                ),
                Expanded(
                    child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Eventtile(),
                    Eventtile(),
                    Eventtile(),
                    Eventtile(),
                    Eventtile(),
                    Eventtile(),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
