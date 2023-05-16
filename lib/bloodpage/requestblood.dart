import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Requestblood extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RequestbloodChild();
  }
}

class RequestbloodChild extends State<Requestblood> {
  String dropdownvalue = 'A+';
  String? urgency;
  final controller = TextEditingController();
  bool isenabled = false;

  TextEditingController dateinput = TextEditingController();
  final timeController = TextEditingController();
  final timeController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    dateinput.text = "";
    var items = [
      'O+',
      'O-',
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
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
                            value: dropdownvalue,

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
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("How many blood units do you require"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            decoration:
                                InputDecoration(labelText: 'Amount of units'),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
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
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                              "If this is not urgent when is the best time to donate"),
                        ),
                        TextField(
                          readOnly: true,
                          enabled: isenabled,
                          decoration: InputDecoration(
                              icon:
                                  Icon(Icons.access_time), //icon of text field
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
//////////////////
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("End of the donation period"),
                        ),
                        TextField(
                          readOnly: true,
                          enabled: isenabled,
                          decoration: InputDecoration(
                              icon:
                                  Icon(Icons.access_time), //icon of text field
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
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Container(
                            width: width,
                            height: height * 0.07,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Add location",
                                  style: TextStyle(fontSize: width * 0.08),
                                ))),
                        SizedBox(
                          height: height * 0.02,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Bloodmain()),
                          );
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
