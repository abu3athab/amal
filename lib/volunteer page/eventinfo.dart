import 'package:demo2/log%20in/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Eventinfo extends StatelessWidget {
  String name;
  String startTime;
  String endTime;
  String loca;
  String desc;
  Eventinfo(
      {required this.name,
      required this.startTime,
      required this.endTime,
      required this.loca,
      required this.desc});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  final timeController = TextEditingController();
  final timeController2 = TextEditingController();
  String location = 'Amman';

  // List of items in our dropdown menu
  var items = [
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 8, 8),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                  child: Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: width * 0.10),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    children: [
                      Text("Event time : ",
                          style: TextStyle(fontSize: width * 0.06)),
                      Text(startTime, style: TextStyle(fontSize: width * 0.05)),
                      Text("-", style: TextStyle(fontSize: width * 0.05)),
                      Text(endTime, style: TextStyle(fontSize: width * 0.05)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                  child: Row(
                    children: [
                      Text(
                        "Location $loca",
                        style: TextStyle(fontSize: width * 0.05),
                      ),
                    ],
                  ),
                ),
                //////
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                  child: Row(
                    children: [
                      Text(
                        "Event description",
                        style: TextStyle(fontSize: width * 0.06),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.9,
                  height: height * 0.4,
                  child: Text(
                    desc,
                    style: TextStyle(fontSize: width * 0.04),
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
                ),

                SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Count me in!!"),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
