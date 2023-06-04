// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo2/Main%20page/mainPage.dart';
// import 'package:demo2/bloodpage/bloodtiles.dart';
// import 'package:demo2/bloodpage/requestblood.dart';
// import 'package:demo2/profilepage.dart/profileBadges.dart';
// import 'package:demo2/profilepage.dart/profileView.dart';
// import 'package:demo2/volunteer%20page/eventtiles.dart';
// import 'package:demo2/volunteer%20page/manageyourevents.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shrink_sidemenu/shrink_sidemenu.dart';

// import '../bloodpage/bloodmainpage.dart';
// import '../chairty page/charitymainpage.dart';
// import '../chairty page/charitytiles.dart';
// import '../colors.dart';
// import '../side bar/side_bar.dart';
// import '../volunteer page/volunteermain.dart';
// import 'adminBloodtiles.dart';
// import 'admincharityapprovalcard.dart';

// class CheckUrgentMain extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return CheckUrgentChild();
//   }
// }

// class CheckUrgentChild extends State<CheckUrgentMain> {
//   // List<BloodRequesterModel> requester = List.empty(growable: true);
// CollectionReference urgentRef = FirebaseFirestore.instance
//     .collection('bloodReq')
//     .doc('IRfqh4URf73SlN04i2yQ')
//     .collection('urgent');

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.centerRight,
//               end: Alignment.bottomLeft,
//               colors: [Colors.white, Colors.white])),
//       child: SafeArea(
//         bottom: false,
//         child: SideMenu(
//           background: logoColor,
//           key: _sideMenuKey,
//           menu: Sidemenu(),
//           type: SideMenuType.shrinkNSlide,
//           child: Scaffold(
//             backgroundColor: Colors.white,
//             body: Padding(
//               padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Hi, Alessandra",
//                               style: TextStyle(
//                                   color: Colors.black, fontSize: width * 0.06),
//                             ),
//                             Text(
//                               "This is your administrative page",
//                               style: TextStyle(
//                                   color: Colors.black, fontSize: width * 0.04),
//                             ),
//                             Text(
//                               "Create great experience for all users",
//                               style: TextStyle(
//                                   color: Colors.black, fontSize: width * 0.04),
//                             ),
//                           ],
//                         ),
//                       ),
//                       CircleAvatar(
//                         backgroundImage: AssetImage('assets/girlportrait.jpeg'),
//                         radius: height * 0.04,
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     thickness: 2,
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
//                         child: Text(
//                           "Aprove urgent blood Requests",
//                           style: TextStyle(fontSize: width * 0.06),
//                         ),
//                       )
//                     ],
//                   ),
//                   Container(
//                     width: width * 0.95,
//                     height: height * 0.4,
//                     decoration: BoxDecoration(color: Colors.white),
//   child: Expanded(
//       child: StreamBuilder<Object>(
//           stream: urgentRef.snapshots(),
//           builder: (context, snapshot) {
//             return FutureBuilder(
//               future: urgentRef.get(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState ==
//                     ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return Text("error: ${snapshot.error}");
//                 } else {
//                   return ListView.builder(
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: ((context, index) {
//                         return AdminBloodtiles(
//                           location: snapshot.data!.docs[index]
//                               .get('location name'),
//                           bloodType: snapshot
//                               .data!.docs[index]
//                               .get('blood type'),
//                           nOfUnits: snapshot.data!.docs[index]
//                               .get('number of units'),
//                           uid: snapshot.data!.docs[index]
//                               .get('user id'),
//                         );
//                       }));
//                 }
//               },
//             );
//           })),
// ),
//                   SizedBox(
//                     height: 5,
//                   ),

//                   Divider(
//                     thickness: 2,
//                   ),
//                   Text(
//                     "View the differnet aspects of the system",
//                     style: TextStyle(fontSize: width * 0.045),
//                   ),

//                   /////////catagory bar
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: width * 0.001,
//                       ),
//                       SizedBox(
//                         width: width * 0.001,
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     thickness: 2,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
//                     child: Text(
//                       "Manage Chariies and users",
//                       style: TextStyle(fontSize: width * 0.05),
//                     ),
//                   ),

//                   TextButton(
//                       onPressed: () {},
//                       child: Text("System Settings",
//                           style: TextStyle(fontSize: width * 0.09)))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/administrator/administratormain.dart';
import 'package:demo2/administrator/cardapprovalpage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';
import '../side bar/side_bar.dart';
import 'adminBloodtiles.dart';
import 'adminNonUrgentTiles.dart';

class CheckUrgentMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckUrgentMainChild();
  }
}

class CheckUrgentMainChild extends State<CheckUrgentMain> {
  // List<BloodRequesterModel> requester = List.empty(growable: true);
  FirebaseAuth? firebaseAuth = FirebaseAuth.instance;

  CollectionReference urgentRef = FirebaseFirestore.instance
      .collection('bloodReq')
      .doc('IRfqh4URf73SlN04i2yQ')
      .collection('urgent');
  CollectionReference nonUrgentBloodReqRef = FirebaseFirestore.instance
      .collection('bloodReq')
      .doc('IRfqh4URf73SlN04i2yQ')
      .collection('nonurgent');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

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
                    Container(
                        width: width * 0.1,
                        child: InkWell(
                            child: Icon(Icons.arrow_back_ios_new),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminMain()),
                              );
                            })),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Flexible(
                      child: Text(
                        'Be the reason for someone’s heartbeat',
                        style: TextStyle(fontSize: width * 0.07),
                      ),
                    ),
                  ],
                ),

                Divider(
                  thickness: 1,
                ),
                Container(
                  width: width,
                  color: Colors.red,
                  child: Row(

                    children: [
                      Container(
                          width: width * 0.1,
                          child: InkWell(
                              child: Image.asset("assets/menu.gif"),
                              onTap: () => Sidemenu())),
                      SizedBox(
                        width: width * 0.07,
                      ),
                      Flexible(
                        child: Text(
                          'Be the reason for someone’s heartbeat',
                          style: TextStyle(fontSize: width * 0.07),
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    width: width,
                    color: Colors.red,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Urgent requests",
                            style: TextStyle(
                                fontSize: width * 0.07, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "view all",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: width,
                      height: height * 0.3,
                      child: Expanded(
                          child: StreamBuilder<Object>(
                              stream: urgentRef.snapshots(),
                              builder: (context, snapshot) {
                                return FutureBuilder(
                                  future: urgentRef.get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (snapshot.hasError) {
                                      return Text("error: ${snapshot.error}");
                                    } else {
                                      return ListView.builder(
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: ((context, index) {
                                            bool isVerfied = snapshot
                                                .data!.docs[index]
                                                .get('isVerfied');
                                            if (!isVerfied) {
                                              return AdminUrgentBloodtiles(
                                                location: snapshot
                                                    .data!.docs[index]
                                                    .get('location name'),
                                                bloodType: snapshot
                                                    .data!.docs[index]
                                                    .get('blood type'),
                                                nOfUnits: snapshot
                                                    .data!.docs[index]
                                                    .get('number of units'),
                                                uid: snapshot.data!.docs[index]
                                                    .get('user id'),
                                              );
                                            } else
                                              return Container();
                                          }));
                                    }
                                  },
                                );
                              }))),
                  ///////////////////////////////////////////////////////////////
                  Container(
                    width: width,
                    color: Colors.blue,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Non Urgent requests",
                            style: TextStyle(
                                fontSize: width * 0.07, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "view all",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: width,
                      height: height * 0.29,
                      child: Expanded(
                          child: StreamBuilder<Object>(
                              stream: nonUrgentBloodReqRef.snapshots(),
                              builder: (context, snapshot) {
                                return FutureBuilder(
                                  future: nonUrgentBloodReqRef.get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (snapshot.hasError) {
                                      return Text("error: ${snapshot.error}");
                                    } else {
                                      return ListView.builder(
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: ((context, index) {
                                            bool isVerfied = snapshot
                                                .data!.docs[index]
                                                .get('isVerfied');
                                            if (!isVerfied) {
                                              return AdminNonUrgentBloodtiles(
                                                location: snapshot
                                                    .data!.docs[index]
                                                    .get('location name'),
                                                bloodType: snapshot
                                                    .data!.docs[index]
                                                    .get('blood type'),
                                                nOfUnits: snapshot
                                                    .data!.docs[index]
                                                    .get('number of units'),
                                                uid: snapshot.data!.docs[index]
                                                    .get('user id'),
                                              );
                                            } else
                                              return Container();
                                          }));
                                    }
                                  },
                                );
                              }))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
