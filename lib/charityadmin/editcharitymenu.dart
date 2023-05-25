import 'dart:ffi';
import 'dart:io';
import 'package:demo2/charityadmin/charityadminmain.dart';
import 'package:image_picker/image_picker.dart';
import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/chairty%20page/charityitemlist.dart';
import 'package:demo2/chairty%20page/charitymainpage.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/profilepage.dart/profile.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/volunteermain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../chairty page/charitytiles.dart';

class Editcharitymenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditcharitymenuChild();
  }
}

var catagory = "catagory";

class EditcharitymenuChild extends State<Editcharitymenu> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var availableHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;

    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

    var types = [
      "catagory",
      "Food",
      "Clothing",
      "Utilites",
      "Fun",
      "Education",
      "Health",
    ];

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
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {},
                      ),
                      Spacer(),
                      Text(
                        "Add Services",
                        style: TextStyle(fontSize: width * 0.1),
                      ),
                      Spacer(),
                      Spacer()
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "pleae note that services are displayed as cards for the app user, please fill out the following form to add a new service.",
                      style: TextStyle(fontSize: width * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("what is the name of the service"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'name',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("service Description"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: false,
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'description',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("How much does it cost"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cost',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("To which catagory does it apply"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: DropdownButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: catagory,
                      // Array list of items
                      items: types.map((String types) {
                        return DropdownMenuItem(
                          value: types,
                          child: Text(types),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          catagory = newValue!;
                        });
                      },
                    ),
                  ),

///////////////////
                  ElevatedButton(
                      onPressed: () async {
                        image =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          //update UI
                        });
                      },
                      child: Text("Pick Image")),

                  image == null ? Container() : Image.file(File(image!.path)),

                  SizedBox(
                    height: height * 0.1,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Charityadminmain()),
                        );
                      },
                      child: Text(
                        "create",
                        style: TextStyle(fontSize: width * 0.1),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
