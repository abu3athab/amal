import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/log%20in/user.dart';
import 'package:demo2/profilepage.dart/profileBadges.dart';
import 'package:demo2/profilepage.dart/profileView.dart';
import 'package:demo2/volunteer%20page/createnewevent.dart';
import 'package:demo2/volunteer%20page/eventtiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Manageevents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ManageeventsChild();
  }
}

class ManageeventsChild extends State<Manageevents> {
  late String uid = FirebaseAuth.instance.currentUser!.uid;
  late CollectionReference ref = FirebaseFirestore.instance
      .collection('events')
      .doc(uid)
      .collection('myEvents');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _editProfileKey = GlobalKey<FormState>();

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white])),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Manage your active events"),
            backgroundColor: logoColor,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 8, 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: height * 0.75,
                    child: Expanded(
                        child: StreamBuilder<Object>(
                            stream: ref.snapshots(),
                            builder: (context, snapshot) {
                              return FutureBuilder(
                                future: ref.get(),
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
                                          return Eventtile(
                                            location: snapshot.data!.docs[index]
                                                .get('location'),
                                            date: snapshot.data!.docs[index]
                                                .get('date'),
                                            startTime: snapshot
                                                .data!.docs[index]
                                                .get('startTime'),
                                            name: snapshot.data!.docs[index]
                                                .get('name'),
                                            desc: snapshot.data!.docs[index]
                                                .get('description'),
                                            finishTime: snapshot
                                                .data!.docs[index]
                                                .get('endTime'),
                                            eventID: snapshot.data!.docs[index]
                                                .get('id'),
                                          );
                                        }));
                                  }
                                },
                              );
                            })),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: width,
                      height: height * 0.07,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(logoColor)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Createnewevent()),
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
      ),
    );
  }

  Future<List<QueryDocumentSnapshot>> fetchDocuments(String documentId) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('documents')
          .where('id', isEqualTo: documentId)
          .get();

      return querySnapshot.docs;
    } catch (e) {
      print('Error fetching documents: $e');
      return [];
    }
  }
}
