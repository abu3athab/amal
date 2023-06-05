import 'package:demo2/charityadmin/charityadminmain.dart';
import 'package:demo2/charityadmin/charityadminsettings.dart';
import 'package:demo2/log%20in/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Charitysettingslocation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CharitysettingslocationChild();
  }
}

class CharitysettingslocationChild extends State<Charitysettingslocation> {
  String? uid = FirebaseAuth.instance.currentUser!.uid;
  Future<void> updateCharitylocation(String location) async {
    if (uid != null) {
      try {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .update({'location': location});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Charity location updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update charity name')),
        );
      }
    }
  }

  TextEditingController dateinput = TextEditingController();

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
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 8, 8),
            child: Column(
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
                Container(
                  width: width,
                  height: height * 0.75,
                  child: Expanded(
                      child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Change the location of the Charity"),
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
                        onPressed: () async {
                          await updateCharitylocation(location);
                        },
                        child: Text(
                          "Change",
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
