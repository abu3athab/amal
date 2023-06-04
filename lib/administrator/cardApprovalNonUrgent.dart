// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo2/bloodpage/bloodmainpage.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../log in/user.dart';

// class CardApprovalForNonUrgent extends StatefulWidget {
//   String location;
//   String bloodType;
//   String nOfUnits;
//   String uid;
//   String name;
//   String email;
//   String phoneNumber;
//   CardApprovalForNonUrgent(
//       {required this.location,
//       required this.bloodType,
//       required this.nOfUnits,
//       required this.uid,
//       required this.name,
//       required this.email,
//       required this.phoneNumber});
//   @override
//   State<StatefulWidget> createState() {
//     return CardapprovalpageNonChild();
//   }
// }

// class CardapprovalpageNonChild extends State<CardApprovalForNonUrgent> {
//   Future<void> deleteDocument(String documentId) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('bloodReq')
//           .doc('IRfqh4URf73SlN04i2yQ')
//           .collection('nonurgent')
//           .doc(widget.uid)
//           .delete();
//       print('Document deleted successfully');
//     } catch (e) {
//       print('Error deleting document: $e');
//     }
//   }

//   Future<void> updateAttribute(String documentId, bool newValue) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('bloodReq')
//           .doc('IRfqh4URf73SlN04i2yQ')
//           .collection('nonurgent')
//           .doc(documentId)
//           .update({'isVerfied': newValue});
//       print('Attribute updated successfully');
//     } catch (e) {
//       print('Error updating attribute: $e');
//     }
//   }

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
//                         "doner info:",
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
//                             updateAttribute(widget.uid, true);
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
//                             deleteDocument(widget.uid);
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
import 'package:firebase_messaging/firebase_messaging.dart';
import '../log in/user.dart';

class CardApprovalForUrgent extends StatefulWidget {
  String location;
  String bloodType;
  String nOfUnits;
  String uid;
  String name;
  String email;
  String phoneNumber;
  CardApprovalForUrgent(
      {required this.location,
      required this.bloodType,
      required this.nOfUnits,
      required this.uid,
      required this.name,
      required this.email,
      required this.phoneNumber});
  @override
  State<StatefulWidget> createState() {
    return CardapprovalpageChild();
  }
}

class CardapprovalpageChild extends State<CardApprovalForUrgent> {
  Future<void> deleteDocument(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('bloodReq')
          .doc('IRfqh4URf73SlN04i2yQ')
          .collection('urgent')
          .doc(widget.uid)
          .delete();
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  Future<void> updateAttribute(String documentId, bool newValue) async {
    try {
      await FirebaseFirestore.instance
          .collection('bloodReq')
          .doc('IRfqh4URf73SlN04i2yQ')
          .collection('urgent')
          .doc(widget.uid)
          .update({'isVerfied': newValue});
      print('Attribute updated successfully');
    } catch (e) {
      print('Error updating attribute: $e');
    }
  }

  CollectionReference userRef = FirebaseFirestore.instance.collection('Users');
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
                  child: Image.asset('assets/donateblood.png'),
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
                        "doner info:",
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
                  //
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
                            updateAttribute(widget.uid, true);
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
                          child: Text("Deny",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30)),
                          onPressed: () async {
                            deleteDocument(widget.uid);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
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
