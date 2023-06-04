// import 'package:demo2/Main%20page/mainPage.dart';
// import 'package:demo2/bloodpage/bloodtiles.dart';
// import 'package:demo2/bloodpage/requestblood.dart';
// import 'package:demo2/chairty%20page/charityitemlist.dart';
// import 'package:demo2/chairty%20page/charitytiles.dart';
// import 'package:demo2/paymentPages/choosepaymentmethode.dart';
// import 'package:demo2/profilepage.dart/profileBadges.dart';
// import 'package:demo2/profilepage.dart/profileView.dart';
// import 'package:demo2/side%20bar/side_bar.dart';
// import 'package:demo2/volunteer%20page/eventtiles.dart';
// import 'package:demo2/volunteer%20page/manageyourevents.dart';
// import 'package:flutter/material.dart';

// class Charitypage extends StatefulWidget {
// String bio;
// String charityName;
// String location;
// String uid;
// Charitypage(
//     {required this.bio, required this.charityName, required this.location,required this.uid});
//   @override
//   State<StatefulWidget> createState() {
//     return CharitypageChild();
//   }
// }

// class CharitypageChild extends State<Charitypage> {
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
//                 Container(
//                     width: width,
//                     height: height * 0.21,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage(
//                               "assets/flat-illustration-world-humanitarian-day_23-2149484207 (1).png"),
//                           fit: BoxFit.cover,
//                           opacity: 0.4),
//                     ),
//                     child: Column(
//                       children: [
//                         Text(
//                           widget.charityName,
//                           style: TextStyle(fontSize: width * 0.08),
//                         ),
//                         Text(
//                           widget.bio,
//                           style: TextStyle(fontSize: width * 0.04),
//                         ),
//                         Spacer(),
//                         Row(children: [
//                           Text(
//                             "location:${widget.location}, Jordan",
//                             style: TextStyle(fontSize: width * 0.05),
//                           ),
//                           Spacer(),
//                           TextButton(onPressed: () {}, child: Text("view info"))
//                         ]),
//                       ],
//                     )),
//                 //////////////////////////////
//                 Container(
//                     width: width,
//                     height: height * 0.10,
//                     child: Row(
//                       children: [
//                         Container(
//                             width: width * 0.1,
//                             child: InkWell(
//                               child: Image.asset("assets/menu.gif"),
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Sidemenu()),
//                                 );
//                               },
//                             )),
//                         Spacer(),
//                         Container(
//                           width: width * 0.7,
//                           child: TextField(
//                             cursorColor: Colors.grey,
//                             decoration: InputDecoration(
//                               focusedBorder: UnderlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.grey, width: 1)),
//                               hintText: 'Try Food.clothing...',
//                             ),
//                             style: TextStyle(fontSize: height * 0.021),
//                           ),
//                         ),
//                         Spacer(),
//                         Container(
//                             width: width * 0.1,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                             ),
//                             child: InkWell(
//                               child: Image.asset("assets/magnifying-glass.gif"),
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Choosepayment()),
//                                 );
//                               },
//                             )),
//                       ],
//                     )),
//                 Expanded(
//                     child: ListView(
//                   padding: const EdgeInsets.all(8),
//                   children: <Widget>[
//                     // Charityitems(),
//                     // Charityitems(),
//                     // Charityitems(),
//                     // Charityitems(),
//                     // Charityitems(),
//                     // Charityitems(),
//                   ],
//                 )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/chairty%20page/charityitemlist.dart';
import 'package:flutter/material.dart';

class Charitypage extends StatefulWidget {
  String bio;
  String charityName;
  String location;
  String charityID;
  Charitypage(
      {required this.bio,
      required this.charityName,
      required this.location,
      required this.charityID});

  @override
  State<StatefulWidget> createState() {
    return CharitypageChild();
  }
}

class CharitypageChild extends State<Charitypage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charity Page'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _firestore
            .collection('Users')
            .doc(widget.charityID)
            .collection('myProducts')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
              snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              final QueryDocumentSnapshot<Map<String, dynamic>> document =
                  documents[index];

              // Render the attributes of the product document
              return Charityitems(
                  imageUrl: document['imageUrl'],
                  name: document['product name'],
                  desc: document['desc'],
                  cost: document['cost'],
                  categ: document['categ'],
                  itemID: document['id'],
                  charityID: widget.charityID);
            },
          );
        },
      ),
    );
  }
}
