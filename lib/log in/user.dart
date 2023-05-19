import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

Future<void> addUser(
    String username, String email, String phoneNumber, String password) async {
  CollectionReference users =
      await FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.add({
    'name': username,
    'email': email,
    'phone number': phoneNumber,
    'password': password,
    'uid': uid
  });
  return;
}

Future<void> addCharity(String username, String email, String phoneNumber,
    String password, String v) async {
  CollectionReference charities =
      await FirebaseFirestore.instance.collection('Charities');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  charities.add({
    'name': username,
    'email': email,
    'phone number': phoneNumber,
    'password': password,
    'verified': v,
    'uid': uid
  });
  return;
}
