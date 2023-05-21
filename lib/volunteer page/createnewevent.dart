import 'package:demo2/log%20in/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Createnewevent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateneweventChild();
  }
}

class CreateneweventChild extends State<Createnewevent> {
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
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

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
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("what is the name of the event"),
                      ),
                      TextField(
                        controller:
                            _nameController, // Name controller added here
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Event name',
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("what will we do during the event"),
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        controller:
                            _descriptionController, // Description controller added here
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Event Description',
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("when will the event take place"),
                      ),
                      TextField(
                        controller: dateinput,
                        decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: "Enter Date"),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              dateinput.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("what time of day will the event start"),
                      ),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.access_time),
                            labelText: "Enter Time"),
                        controller: timeController,
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());

                          if (time != null) {
                            timeController.text = time.format(context);
                          }
                        },
                      ),
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
                            icon: Icon(Icons.access_time),
                            labelText: "Enter Time"),
                        controller: timeController2,
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());

                          if (time != null) {
                            timeController2.text = time.format(context);
                          }
                        },
                      ),
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
                          value: location,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              location = newValue!;
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
                          addEvent(
                              _nameController.text,
                              _descriptionController.text,
                              dateinput.text,
                              timeController.text,
                              timeController2.text,
                              location);
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
