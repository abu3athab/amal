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

class Charitysettingsname extends StatefulWidget {
  const Charitysettingsname({super.key});

  @override
  State<StatefulWidget> createState() {
    return CharitysettingsnameChild();
  }
}

class CharitysettingsnameChild extends State<Charitysettingsname> {
  final TextEditingController _charityNameController = TextEditingController();
  String? uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  void dispose() {
    _charityNameController.dispose();
    super.dispose();
  }

  Future<void> updateCharityName(String charityName) async {
    if (uid != null) {
      try {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .update({'charity name': charityName});
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Charity name updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update charity name')),
        );
      }
    }
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
                      "Edit your Charity name",
                      style: TextStyle(fontSize: width * 0.08),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _charityNameController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: width * 0.8,
                      height: height * 0.07,
                      child: ElevatedButton.icon(
                          onPressed: () async {
                            String charityName = _charityNameController.text;
                            await updateCharityName(charityName);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Charityadminmain()),
                            );
                          },
                          icon: const Icon(
                            // <-- Icon
                            Icons.logout,
                            size: 24.0,
                          ),
                          label: const Text('Done'),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
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
      ),
    );
  }
}
