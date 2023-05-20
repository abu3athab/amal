import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
            ElevatedButton(
              onPressed: _updateProfile,
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateProfile() async {
    User? user = _auth.currentUser;
    if (user != null) {
      //Update Email
      user.updateEmail(_emailController.text).then((_) {
        print("Successfully updated email");
      }).catchError((error) {
        print("Failed to update user: $error");
      });

      //Update Password
      user.updatePassword(_passwordController.text).then((_) {
        print("Successfully updated password");
      }).catchError((error) {
        print("Failed to update user: $error");
      });

      //Update Name and Phone in Firestore
      CollectionReference Users = FirebaseFirestore.instance.collection('Users');
      Users.doc(user.uid).set({
        'name': _nameController.text,
        'phone': _phoneController.text
      }, SetOptions(merge: true)).then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
    }
  }
}
