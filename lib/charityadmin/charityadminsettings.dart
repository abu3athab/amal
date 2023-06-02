import 'dart:ffi';
import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/chairty%20page/charityitemlist.dart';
import 'package:demo2/chairty%20page/charitymainpage.dart';
import 'package:demo2/charityadmin/charityadminmain.dart';
import 'package:demo2/charityadmin/editcharitymenu.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/log%20in/logIn.dart';
import 'package:demo2/profilepage.dart/profile.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/volunteermain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../chairty page/charitytiles.dart';

class Charityadminsettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CharityadminsettingsChild();
  }
}

class CharityadminsettingsChild extends State<Charityadminsettings> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var availableHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;

    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

    return SafeArea(
      bottom: false,
      child: SideMenu(
        background: logoColor,
        key: _sideMenuKey,
        menu: Sidemenu(),
        type: SideMenuType.shrinkNSlide,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Charityadminmain()),
                          );
                        },
                      ),
                      Spacer(),
                      Text(
                        "Settings",
                        style: TextStyle(fontSize: width * 0.1),
                      ),
                      Spacer(),
                      Spacer(),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Text(
                    "Account Settings",
                    style: TextStyle(fontSize: width * 0.07),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () => null,
                      title: Text("Edit Password"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: logoColor,
                      ),
                      leading: Icon(
                        Icons.password,
                        color: logoColor,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () => null,
                      title: Text("Delete Account"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: logoColor,
                      ),
                      leading: Icon(
                        Icons.delete,
                        color: logoColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Text(
                    "Charity Settings",
                    style: TextStyle(fontSize: width * 0.07),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () => null,
                      title: Text("Change Charity Name"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: logoColor,
                      ),
                      leading: Icon(
                        Icons.auto_fix_normal_outlined,
                        color: logoColor,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () => null,
                      title: Text("Change Charity Location"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: logoColor,
                      ),
                      leading: Icon(
                        Icons.location_city,
                        color: logoColor,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () => null,
                      title: Text("View Donation history"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: logoColor,
                      ),
                      leading: Icon(
                        Icons.history,
                        color: logoColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        icon: Icon(
                          // <-- Icon
                          Icons.logout,
                          size: 24.0,
                        ),
                        label: Text('Log out'),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        )))
// <-- Text
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
