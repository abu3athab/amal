import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/administrator/admincharityapprovalcard.dart';
import 'package:demo2/administrator/cardapprovalpage.dart';
import 'package:demo2/bloodpage/bloodrequestinfo.dart';
import 'package:flutter/material.dart';

import 'cardApprovalNonUrgent.dart';

class AdminNonUrgentBloodtiles extends StatefulWidget {
  String location;
  String bloodType;
  String nOfUnits;
  String uid;
  AdminNonUrgentBloodtiles(
      {required this.location,
      required this.bloodType,
      required this.nOfUnits,
      required this.uid});

  @override
  State<AdminNonUrgentBloodtiles> createState() =>
      _AdminNonUrgentBloodtilesState();
}

class _AdminNonUrgentBloodtilesState extends State<AdminNonUrgentBloodtiles> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () async {
        try {
          CollectionReference userRef =
              FirebaseFirestore.instance.collection('Users');
          DocumentSnapshot userDoc = await userRef.doc(widget.uid).get();

          if (userDoc.exists) {
            // User data exists
            var userData = userDoc.data();
            String username;

            String email;

            String phoneNumber;
            String u;
            // Access the attributes

            email = userDoc.get('email');
            phoneNumber = userDoc.get('phone number');
            username = userDoc.get('name');

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardApprovalForNonUrgent(
                        location: widget.location,
                        bloodType: widget.bloodType,
                        nOfUnits: widget.nOfUnits,
                        uid: widget.uid,
                        name: username!,
                        email: email!,
                        phoneNumber: phoneNumber!,
                      )),
            );

            // ... retrieve other attributes

            // Do something with the user data
          } else {
            // User data doesn't exist
            print('User not found');
          }
        } catch (e) {
          print('Error retrieving user data: $e');
        }
      },
      child: Container(
        width: width * 0.95,
        height: height * 0.161,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 10,
          child: Row(
            children: [
              Container(
                child: Image.asset(
                    "assets/illustration-person-donating-blood_23-2148236971.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.location!,
                      style: TextStyle(fontSize: height * 0.03),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      "Blood type: ${widget.bloodType!}",
                      style: TextStyle(fontSize: height * 0.028),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      "requried units : ${widget.nOfUnits!}",
                      style: TextStyle(fontSize: height * 0.028),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      "Click to view info",
                      style: TextStyle(fontSize: height * 0.01),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
