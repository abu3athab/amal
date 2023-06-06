import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/bloodpage/bloodtiles.dart';
import 'package:demo2/bloodpage/requestblood.dart';
import 'package:demo2/chairty%20page/charitytiles.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/side%20bar/side_bar.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:demo2/volunteer%20page/manageyourevents.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../colors.dart';

class Charitymain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CharitymainChild();
  }
}

class CharitymainChild extends State<Charitymain> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String searchText = '';
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
                ////search bar/////////////////
                Container(
                    width: width,
                    height: height * 0.10,
                    child: Row(
                      children: [
                        Container(
                            width: width * 0.1,
                            child: InkWell(
                              child: Icon(Icons.arrow_back_ios_new),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()),
                                );
                              },
                            )),
                        Spacer(),
                        Container(
                          width: width * 0.7,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchText = value;
                              });
                            },
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1)),
                              hintText: 'Try Charity,Food.clothing...',
                            ),
                            style: TextStyle(fontSize: height * 0.021),
                          ),
                        ),
                        Spacer(),
                        Container(
                            width: width * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Image.asset("assets/magnifying-glass.gif")),
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Featured Charities"),
                      Spacer(),
                      TextButton(onPressed: () {}, child: Text("view all"))
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: _firestore.collection('Users').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                          documents = snapshot.data!.docs;
                      final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                          charityDocuments = documents
                              .where((doc) => doc['type'] == 'charity')
                              .toList();

                      return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: charityDocuments.length,
                        itemBuilder: (BuildContext context, int index) {
                          final QueryDocumentSnapshot<Map<String, dynamic>>
                              document = charityDocuments[index];
                          final String userId = document.id;
                          bool isVerfied = document['isVerfied'];
                          if (isVerfied) {
                            if (searchText.isEmpty) {
                              return Charitytiles(
                                charityName: document['charity name'],
                                location: document['location'],
                                bio: document['charity bio'],
                                charityID: document['uid'],
                                imageUrl: document['imageUrl'],
                                donersNumber: document['count'],
                              );
                            } else if (document['charity name']
                                .toString()
                                .toLowerCase()
                                .contains(searchText.toLowerCase())) {
                              return Charitytiles(
                                charityName: document['charity name'],
                                location: document['location'],
                                bio: document['charity bio'],
                                charityID: document['uid'],
                                imageUrl: document['imageUrl'],
                                donersNumber: document['count'],
                              );
                            } else
                              return Container(
                                child:
                                    Text("Sorry nothing matches your search"),
                              );
                          } else {
                            return Container();
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../colors.dart';

// class Charitymain extends StatelessWidget {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.centerRight,
//           end: Alignment.bottomLeft,
//           colors: [Colors.white, Colors.white],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//           stream: _firestore.collection('Users').snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//             if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }

//             final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = snapshot.data!.docs;
//             final List<QueryDocumentSnapshot<Map<String, dynamic>>> charityDocuments =
//                 documents.where((doc) => doc['type'] == 'charity').toList();

//             return ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: charityDocuments.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final QueryDocumentSnapshot<Map<String, dynamic>> document = charityDocuments[index];
//                 final String userId = document.id;

//                 return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                   future: _firestore.collection('Users').doc(userId).collection('myProducts').get(),
//                   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//                     if (snapshot.hasError) {
//                       return Text('Error: ${snapshot.error}');
//                     }

//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return CircularProgressIndicator();
//                     }

//                     final List<QueryDocumentSnapshot<Map<String, dynamic>>> productDocuments = snapshot.data!.docs;

//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListTile(
//                           title: Text(document['title']),
//                           // Display more fields or widgets from the charity document
//                         ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: productDocuments.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final QueryDocumentSnapshot<Map<String, dynamic>> productDocument =
//                                 productDocuments[index];
//                             return ListTile(
//                               title: Text(productDocument['title']),
//                               // Display more fields or widgets from the product document
//                             );
//                           },
//                         ),
//                         Divider(
//                           thickness: 1,
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

