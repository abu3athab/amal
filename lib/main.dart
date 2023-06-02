// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo2/Main%20page/mainPage.dart';
// import 'package:demo2/administrator/admincharityapprovalcard.dart';
// import 'package:demo2/charityadmin/charityadminmain.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'log in/logIn.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitDown,
//     DeviceOrientation.portraitUp,
//   ]);
//   runApp(MyApp());
// }

// Future<String?> getUserType(String id) async {
//   final uid = id;
//   final userData = await FirebaseFirestore.instance
//       .collection('Users')
//       .where('uid', isEqualTo: uid)
//       .get();
//   if (userData.docs.isNotEmpty) {
//     final userSnapshot = userData.docs.firstWhere((doc) => doc['uid'] == uid);
//     String type = userSnapshot.get('type');
//     return type;
//   }
// }

// class MyApp extends StatelessWidget {
//   CollectionReference userRef = FirebaseFirestore.instance.collection('Users');
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             String id = snapshot.data!.uid;
//             return FutureBuilder<QuerySnapshot>(
//               future: userRef.get(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {

//                   if (userType == 'charity') {
//                     return Charityadminmain();
//                   } else if (userType == 'user') {
//                     return MainPage();
//                   } else
//                     return Login();
//                 } else
//                   return Login();
//               },
//             );
//           } else {
//             return Login();
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/administrator/admincharityapprovalcard.dart';
import 'package:demo2/administrator/administratormain.dart';
import 'package:demo2/charityadmin/charityadminmain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'log in/logIn.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

Future<String?> getUserType(String id) async {
  final uid = id;
  final userData = await FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: uid)
      .get();
  if (userData.docs.isNotEmpty) {
    final userSnapshot = userData.docs.first;
    String type = userSnapshot.get('type');
    return type;
  }
  return null;
}

class MyApp extends StatelessWidget {
  CollectionReference userRef = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String id = snapshot.data!.uid;
            return FutureBuilder<String?>(
              future: getUserType(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  String? userType = snapshot.data;
                  if (userType == 'charity') {
                    return Charityadminmain();
                  } else if (userType == 'user') {
                    return MainPage();
                  } else if (userType == 'admin') {
                    return AdminMain();
                  } else
                    return Login();
                } else {
                  return Login();
                }
              },
            );
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
