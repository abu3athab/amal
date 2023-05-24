import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';

class Charitydetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CharitydetailsChild();
  }
}

class CharitydetailsChild extends State<Charitydetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

    String? location = "Amman";

    var locations = [
      'Ajlun',
      'Amman',
      'Aqaba',
      'Balqa',
      'Irbid',
      'Jarash',
      'Karak',
      'Maan',
      'Madaba',
      'Mafraq',
      'Tafilah',
      'Zarqa',
    ];

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white])),
      child: SafeArea(
        bottom: false,
        child: SideMenu(
          background: logoColor,
          key: _sideMenuKey,
          menu: Sidemenu(),
          type: SideMenuType.shrinkNSlide,
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
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                              20.0) //                 <--- border radius here
                          ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Are you ready to change the world for the better",
                        style: TextStyle(
                            color: Colors.black, fontSize: width * 0.01),
                      ),
                    ),
                  ),
                  Text("lets start by entering the Charity info",
                      style: TextStyle(
                        fontSize: width * 0.05,
                      )),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    height: height * 0.65,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("what is the name of the Charity"),
                        ),
                        TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Charity name',
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        /////////
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("what is the goal of this Charity"),
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Charity goal (bio)',
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("where will the event take place"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: DropdownButton(
                            // Initial Value
                            value: location,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: locations.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                location = newValue!;
                              });
                            },
                          ),
                        ),
                        /////////
                      ],
                    ),
                  ),
                  Container(
                      width: width,
                      height: height * 0.08,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Request approval from admin ")))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
