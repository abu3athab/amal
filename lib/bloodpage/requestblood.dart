import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../log in/user.dart';

class Requestblood extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RequestbloodChild();
  }
}

class RequestbloodChild extends State<Requestblood> {
  String? urgency;
  final controller = TextEditingController();
  final _bloodUnitsController = TextEditingController();
  String? location = "Amman";
  String? bloodType = 'A+';
  bool isenabled = false;

  void alertUser(bool isAdded) {
    if (isAdded) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("your request has been saved sucessfully"),
        duration: Duration(seconds: 4),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("error saving your request please try again"),
        duration: Duration(seconds: 4),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var types = [
      'O+',
      'O-',
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
    ];
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
                  height: height * 0.3,
                  child: Image.asset("assets/donateblood.png"),
                ),
                Divider(
                  thickness: 1,
                ),
                Expanded(
                  child: Container(
                    width: width,
                    child: Expanded(
                        child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("which blood type do you require"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: DropdownButton(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            value: bloodType,
                            // Array list of items
                            items: types.map((String types) {
                              return DropdownMenuItem(
                                value: types,
                                child: Text(types),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                bloodType = newValue!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("How many blood units do you require"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            // onChanged: (value) {
                            //   _bloodUnitsController.text = value;
                            // },
                            controller: _bloodUnitsController,
                            decoration:
                                InputDecoration(labelText: 'Amount of units'),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Is this an Urgent case or not"),
                        ),
                        RadioListTile(
                          title: Text("Urgent"),
                          value: "urgent",
                          groupValue: urgency,
                          onChanged: (value) {
                            setState(() {
                              urgency = value.toString();
                              isenabled = false;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("Non Urgent"),
                          value: "nonurgent",
                          groupValue: urgency,
                          onChanged: (value) {
                            setState(() {
                              urgency = value.toString();
                              isenabled = true;
                            });
                          },
                        ),

                        ////////////////////////////

                        Padding(
                          padding: const EdgeInsets.all(5.0),
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

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Any additional information"),
                        ),
                        const TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'request information',
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
                Container(
                    width: width,
                    height: height * 0.07,
                    child: ElevatedButton(
                        onPressed: () {
                          if (urgency == 'urgent') {
                            addUrgentBloodUser(location!, bloodType!,
                                _bloodUnitsController.text, urgency!);
                          } else if (urgency == 'nonurgent') {
                            addNonUrgentBloodUser(location!, bloodType!,
                                _bloodUnitsController.text, urgency!);
                          }

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("your request has been added sucessfully"),
                            duration: Duration(seconds: 2),
                          ));
                        },
                        child: Text(
                          "Make request",
                          style: TextStyle(fontSize: width * 0.08),
                        ))),
                SizedBox(
                  width: width,
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
