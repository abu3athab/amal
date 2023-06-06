import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/chairty%20page/charityitemlist.dart';
import 'package:demo2/colors.dart';
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
        backgroundColor: logoColor,
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
