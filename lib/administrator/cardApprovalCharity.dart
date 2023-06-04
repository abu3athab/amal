// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo2/bloodpage/bloodmainpage.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../log in/user.dart';

// class CardApprovalCharity extends StatefulWidget {
//   String location;
//   String bloodType;
//   String nOfUnits;
//   String uid;
//   String name;
//   String email;
//   String phoneNumber;
//   String charityName;
//   CardApprovalCharity(
//       {required this.location,
//       required this.bloodType,
//       required this.nOfUnits,
//       required this.uid,
//       required this.name,
//       required this.email,
//       required this.phoneNumber,
//       required this.charityName});
//   @override
//   State<StatefulWidget> createState() {
//     return CardapprovalCharityChild();
//   }
// }

// class CardapprovalCharityChild extends State<CardApprovalCharity> {

//   CollectionReference userRef = FirebaseFirestore.instance.collection('Users');
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.centerRight,
//               end: Alignment.bottomLeft,
//               colors: [Colors.white, Colors.white])),
//       child: SafeArea(
//         bottom: false,
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: Padding(
//             padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Spacer(),
//                     Spacer(),
//                   ],
//                 ),
//                 Container(
//                   width: width,
//                   height: height * 0.25,
//                   child: Image.asset('assets/donateblood.png'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Location:${widget.location}",
//                         style: TextStyle(fontSize: width * 0.06),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   thickness: 2,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Charity info:",
//                         style: TextStyle(fontSize: width * 0.06),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Text("name: ", style: TextStyle(fontSize: width * 0.06)),
//                       Text(widget.name,
//                           style: TextStyle(fontSize: width * 0.06)),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Text("Charity name:${widget.charityName} ",
//                           style: TextStyle(fontSize: width * 0.06)),
//                       Text(widget.name,
//                           style: TextStyle(fontSize: width * 0.06)),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Text("Email: ", style: TextStyle(fontSize: width * 0.06)),
//                       Text(widget.email,
//                           style: TextStyle(fontSize: width * 0.05)),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Text("Phone number: ",
//                           style: TextStyle(fontSize: width * 0.06)),
//                       Text(widget.phoneNumber,
//                           style: TextStyle(fontSize: width * 0.06)),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.08,
//                 ),
//                 Row(
//                   //
//                   children: [
//                     Container(
//                       width: width * 0.45,
//                       height: height * 0.1,
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: TextButton(
//                           child: Text("Approve"),
//                           onPressed: () async {

//                           },
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Container(
//                       width: width * 0.45,
//                       height: height * 0.1,
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: TextButton(
//                           child: Text("Deny"),
//                           onPressed: () async {

//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/bloodpage/bloodmainpage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../log in/user.dart';

class CardApprovalCharity extends StatefulWidget {
  String location;
  String uid;
  String name;
  String email;
  String phoneNumber;
  String charityName;

  CardApprovalCharity({
    required this.location,
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.charityName,
  });

  @override
  State<StatefulWidget> createState() {
    return CardapprovalCharityChild();
  }
}

class CardapprovalCharityChild extends State<CardApprovalCharity> {
  CollectionReference userRef = FirebaseFirestore.instance.collection('Users');

  // Function to update a document in the charity collection
  Future<void> updateCharityDocument() async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(widget.uid) // Assuming `widget.uid` is the document ID
          .update({
        'isVerfied': true,
        // Add other fields to update in the document
      });

      // Success message or any other action after successful update
    } catch (e) {
      // Error handling
      print('Error updating charity document: $e');
    }
  }

  // Function to delete a document in the Users collection based on the type attribute
  Future<void> deleteDocumentCharity() async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(widget.uid)
          .delete();
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                Row(
                  children: [
                    Spacer(),
                    Spacer(),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.25,
                  child: Image.asset(
                      'assets/facebook-template-with-humanitary-aid-refugees-conceptwatercolor_83728-9598.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Location:${widget.location}",
                        style: TextStyle(fontSize: width * 0.06),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Charity info:",
                        style: TextStyle(fontSize: width * 0.06),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("name: ", style: TextStyle(fontSize: width * 0.06)),
                      Text(widget.name,
                          style: TextStyle(fontSize: width * 0.06)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Charity name:${widget.charityName} ",
                          style: TextStyle(fontSize: width * 0.06)),
                      Text("", style: TextStyle(fontSize: width * 0.06)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Email: ", style: TextStyle(fontSize: width * 0.06)),
                      Text(widget.email,
                          style: TextStyle(fontSize: width * 0.05)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Phone number: ",
                          style: TextStyle(fontSize: width * 0.06)),
                      Text(widget.phoneNumber,
                          style: TextStyle(fontSize: width * 0.06)),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    Container(
                      width: width * 0.45,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: TextButton(
                          child: Text("Approve",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30)),
                          onPressed: () async {
                            // Call the update function when the "Approve" button is pressed
                            await updateCharityDocument();
                          },
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: width * 0.45,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: TextButton(
                          child: Text(
                            "Deny",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          onPressed: () async {
                            // Call the delete function when the "Deny" button is pressed
                            await deleteDocumentCharity();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.012,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
