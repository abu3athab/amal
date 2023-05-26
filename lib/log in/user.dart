import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfo {
  String userName;
  String email = '';
  String phoneNumber = '';
  String password = '';
  UserInfo(
      {required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.password});
}

Future<void> addUser(String username, String email, String phoneNumber,
    String password, String v) async {
  CollectionReference users =
      await FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  DocumentReference userDoc = users.doc(uid);
  userDoc.set({
    'name': username,
    'email': email,
    'phone number': phoneNumber,
    'password': password,
    'verified': v,
    'uid': uid
  });
  return;
}

Future<void> addCharity(
    String username, String email, String phoneNumber, String password) async {
  try {
    CollectionReference charities =
        await FirebaseFirestore.instance.collection('Charities');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    charities.add({
      'name': username,
      'email': email,
      'phone number': phoneNumber,
      'password': password,
      'verified': 'false',
      'charity name': "",
      'charity bio': "",
      'location': '',
      'uid': uid
    });
    return;
  } catch (e) {
    print("error");
  }
}

Future<void> updateUserEmailVerification(String v) async {
  try {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      final uid = user.uid;
      final userData = await firestore
          .collection('Users')
          .where('uid', isEqualTo: uid)
          .get();

      if (userData.docs.isNotEmpty) {
        final userSnapshot =
            userData.docs.firstWhere((doc) => doc['uid'] == uid);

        // Update the specific field here
        await userSnapshot.reference.update({'verified': v});
      }
    }
  } catch (e) {
    print("Error: $e");
  }
}

Future<bool> addUrgentBloodUser(String locationName, String bloodType,
    String requiredUnits, String isUrgent) async {
  try {
    CollectionReference user =
        await FirebaseFirestore.instance.collection('Users');
    CollectionReference urgentBloodRef = await FirebaseFirestore.instance
        .collection('bloodReq')
        .doc('IRfqh4URf73SlN04i2yQ')
        .collection('urgent');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    urgentBloodRef.add({
      'location name': locationName,
      'blood type': bloodType,
      'number of units': requiredUnits,
      'urgency': isUrgent,
      'user id': uid
    });

    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> addNonUrgentBloodUser(String locationName, String bloodType,
    String requiredUnits, String isUrgent) async {
  try {
    CollectionReference user =
        await FirebaseFirestore.instance.collection('Users');
    CollectionReference urgentBloodRef = await FirebaseFirestore.instance
        .collection('bloodReq')
        .doc('IRfqh4URf73SlN04i2yQ')
        .collection('nonurgent');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    urgentBloodRef.add({
      'location name': locationName,
      'blood type': bloodType,
      'number of units': requiredUnits,
      'urgency': isUrgent,
      'user id': uid
    });

    return true;
  } catch (e) {
    return false;
  }
}

// Future<void> addEvent(String name, String description, String date,
//     String startTime, String endTime, String location) async {
//   CollectionReference eventRef =
//       FirebaseFirestore.instance.collection('events');
//   FirebaseAuth auth = FirebaseAuth.instance;
//   String uid = auth.currentUser!.uid;
//   DocumentReference doc = eventRef.doc(uid);
//   await doc.set({
//     'name': name,
//     'uid': uid,
//     'description': description,
//     'date': date,
//     'startTime': startTime,
//     'endTime': endTime,
//     'location': location,
//   });
// }

String getUserId() {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  return uid;
}

Future<void> addEvent(String name, String description, String date,
    String startTime, String endTime, String location) async {
  try {
    // Get the current user's ID
    String uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference userRef =
        FirebaseFirestore.instance.collection('Users');
    DocumentSnapshot userDoc = await userRef.doc(uid).get();

    if (!userDoc.exists) {
      // Handle the case where no matching user document was found
      print('No user document found for the current user.');
      return;
    }

    String userName = userDoc.get('name');
    String userEmail = userDoc.get('email');

    // Create a reference to the user document using the user ID
    DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('events').doc(uid);

    // Create the user document with the specified ID and set the user name and email
    await userDocRef.set({
      'name': userName,
      'email': userEmail,
    });

    // Create a reference to the collection inside the user document for myEvents
    CollectionReference myEventsCollectionRef =
        userDocRef.collection('myEvents');

    // Add data to the collection
    await myEventsCollectionRef.add({
      'name': name,
      'description': description,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'location': location,
    });

    print('Document and collection created successfully!');
  } catch (e) {
    print('Error creating document and collection: $e');
  }
}

Future<void> updateCharityEmailVerification(
    String name, String bio, String location, String v) async {
  try {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      final uid = user.uid;
      final userData = await firestore
          .collection('Charities')
          .where('uid', isEqualTo: uid)
          .get();

      if (userData.docs.isNotEmpty) {
        final userSnapshot =
            userData.docs.firstWhere((doc) => doc['uid'] == uid);

        // Update the specific field here
        await userSnapshot.reference.update({
          'charity name': name,
          'charity bio': bio,
          'location': location,
          'verified': v
        });
      }
    }
  } catch (e) {
    print("Error: $e");
  }
}

Future<void> addMyEvents(String name, String description, String date,
    String startTime, String endTime, String location) async {
  CollectionReference events = FirebaseFirestore.instance.collection('events');
  var auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid;
  await events.add({
    'name': name,
    'description': description,
    'date': date,
    'startTime': startTime,
    'endTime': endTime,
    'location': location,
    'uid': uid
  });
}

CollectionReference eventsRef = FirebaseFirestore.instance.collection('events');
Future<QuerySnapshot> fetchSubcollectionsData() async {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('events').get();

  return querySnapshot;
}

Future<List<QuerySnapshot>> fetchSubcollectionsDataForDocuments(
    List<DocumentSnapshot> documents) async {
  final List<Future<QuerySnapshot>> allEvents = [];

  for (var document in documents) {
    final collectionRef = FirebaseFirestore.instance
        .collection('events')
        .doc(document.id)
        .collection('myEvents');

    allEvents.add(collectionRef.get());
  }

  return await Future.wait(allEvents);
}
