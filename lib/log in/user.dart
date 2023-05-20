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
  users.add({
    'name': username,
    'email': email,
    'phone number': phoneNumber,
    'password': password,
    'verified': v,
    'uid': uid
  });
  return;
}

Future<void> addCharity(String username, String email, String phoneNumber,
    String password, String v) async {
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
      'verified': v,
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

Future<bool> addBloodUser(String locationName, String bloodType,
    String requiredUnits, String isUrgent) async {
  try {
    CollectionReference users =
        await FirebaseFirestore.instance.collection('Users');
    CollectionReference bloodRef =
        await FirebaseFirestore.instance.collection('bloodReq');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    bloodRef.add({
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
