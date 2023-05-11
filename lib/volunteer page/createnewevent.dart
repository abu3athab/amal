// ignore_for_file: unused_import

import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class Createnewevent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateneweventChild();
  }
}

class CreateneweventChild extends State<Createnewevent> {
  TextEditingController dateinput = TextEditingController();
  final timeController = TextEditingController();
  final timeController2 = TextEditingController();
  String dropdownvalue = 'Amman';

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
  void initState() {
    dateinput.text = ""; //set the initial value of text field

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _editProfileKey = GlobalKey<FormState>();
    DateTime _dateTime = DateTime.now();

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
            padding: const EdgeInsets.fromLTRB(8, 3, 8, 8),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "create a new event to help out the community",
                      style: TextStyle(fontSize: width * 0.06),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.75,
                  child: Expanded(
                      child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      ///////////////////////////////////////////////////event name
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("what is the name of the event"),
                      ),
                      const TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Event name',
                        ),
                      ),
///////////////////////////////////////////////////event name
                      SizedBox(
                        height: height * 0.02,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("what will we do during the event"),
                      ),
                      const TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Event Description',
                        ),
                      ),
                      /////////////////event description

                      SizedBox(
                        height: height * 0.02,
                      ),
                      ///////////////////////////////date

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("when will the event take place"),
                      ),
                      TextField(
                        controller:
                            dateinput, //editing controller of this TextField
                        decoration: InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), //icon of text field
                            labelText: "Enter Date" //label text of field
                            ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime
                                  .now(), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              dateinput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      ///////////////////////////////date

//
//

                      //////////////////////time
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("what time of day will the event start"),
                      ),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.access_time), //icon of text field
                            labelText: "Enter Time" //label text of field
                            ),
                        controller: timeController,
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());

                          if (time != null) {
                            timeController.text = time.format(context);
                          }
                        },
                      ),
                      ////////////////////////time end
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("what time of day will the event end"),
                      ),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.access_time), //icon of text field
                            labelText: "Enter Time" //label text of field
                            ),
                        controller: timeController2,
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());

                          if (time != null) {
                            timeController2.text = time.format(context);
                          }
                        },
                      ),
                      //
                      //
                      //
                      ////////////////////////time end
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("where will the event take place"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: DropdownButton(
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: width,
                    height: height * 0.07,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Manageevents()),
                          );
                        },
                        child: Text(
                          "Create a new event",
                          style: TextStyle(fontSize: width * 0.07),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
