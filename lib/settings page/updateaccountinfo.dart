import 'dart:ffi';

import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/log%20in/user.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/settings%20page/set.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';

class Updateaccountinfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UpdateaccountinfoChild();
  }
}

class UpdateaccountinfoChild extends State<Updateaccountinfo> {
  var name = TextEditingController();
  var number = TextEditingController();

  String? checkPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.toString().isEmpty) {
      return "field must not be empty";
    }

    if (phoneNumber.length != 10) {
      return "phone number should consist of 10 digits ";
    }
    if (!(phoneNumber.startsWith('079')) &&
        !(phoneNumber.startsWith('078')) &&
        !(phoneNumber.startsWith('077'))) {
      return "phone number should be Jordanian";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
    final _nameKey = GlobalKey<FormState>();
    final _numberKey = GlobalKey<FormState>();

    return Container(
      decoration: const BoxDecoration(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.2,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Config()),
                            );
                          },
                        ),
                      ),
                      Text(
                        "   Account",
                        style: TextStyle(fontSize: width * 0.1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    children: <Widget>[
                      const Text("Change name:      "),
                      Container(
                        width: width * 0.03,
                      ),
                      Flexible(
                        child: Form(
                          key: _nameKey,
                          child: TextFormField(
                            controller: name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "field must not be empty";
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            if (_nameKey.currentState!.validate()) {
                              await updateUserProfileInfo('name', name.text,
                                  FirebaseAuth.instance.currentUser!.uid);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("name updated successfully")));
                            } else {
                              return;
                            }
                          },
                          child: const Text("Update")),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    children: <Widget>[
                      const Text("Change Number:  "),
                      Container(
                        width: width * 0.03,
                      ),
                      Flexible(
                        child: Form(
                          key: _numberKey,
                          child: TextFormField(
                            validator: checkPhoneNumber,
                            controller: number,
                            decoration: InputDecoration(),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            if (_numberKey.currentState!.validate()) {
                              await updateUserProfileInfo(
                                  'phone number',
                                  number.text,
                                  FirebaseAuth.instance.currentUser!.uid);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("phone updated successfully")));
                            } else {
                              return;
                            }
                          },
                          child: const Text("Update")),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
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
