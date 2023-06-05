import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/chairty%20page/charityitemlist.dart';
import 'package:demo2/chairty%20page/charitymainpage.dart';
import 'package:demo2/charityadmin/charityadminmain.dart';
import 'package:demo2/charityadmin/charityadminsettings.dart';
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

class Charitysettingdel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CharitysettingdelChild();
  }
}

class CharitysettingdelChild extends State<Charitysettingdel> {
  Future<void> deleteDocument() async {
    FirebaseFirestore.instance
        .collection('Users') // Replace with your collection name
        .doc(FirebaseAuth.instance.currentUser!
            .uid) // Replace with the document ID you want to delete
        .delete()
        .then((value) {
      print('Document deleted successfully');
    }).catchError((error) {
      print('Failed to delete document: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var availableHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;

    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: SideMenu(
          background: logoColor,
          key: _sideMenuKey,
          menu: Sidemenu(),
          type: SideMenuType.shrinkNSlide,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
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
                                builder: (context) => Charityadminsettings()),
                          );
                        },
                      ),
                      const Spacer(),
                      Text(
                        "Settings",
                        style: TextStyle(fontSize: width * 0.1),
                      ),
                      const Spacer(),
                      const Spacer(),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Delete your account",
                    style: TextStyle(fontSize: width * 0.1),
                  ),
                  Container(
                    child: Image.asset(
                      "assets/sadgirlpassword.jpeg",
                      height: height * 0.30,
                    ),
                  ),
                  Text(
                    "please keep in mind that this will permently delete your account from our system are you sure you want to delete your account.",
                    style: TextStyle(fontSize: width * 0.07),
                  ),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
                    child: ElevatedButton.icon(
                        onPressed: () async {
                          await FirebaseAuth.instance.currentUser!.delete();
                          deleteDocument();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        icon: const Icon(
                          // <-- Icon
                          Icons.delete_forever,
                          size: 24.0,
                        ),
                        label: const Text('Delete account'),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        )))
                        // <-- Text
                        ),
                  ),
                  const SizedBox(
                    height: 20,
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
