// import 'package:demo2/colors.dart';
// import 'package:flutter/material.dart';

// class LogInEmail extends StatelessWidget {
//   TextEditingController _emailController = TextEditingController();

//   String getUserEmail() {
//     return this._emailController.text;
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Container(
//       margin: EdgeInsets.all(15),
//       child: TextField(
//         controller: _emailController,
//         cursorColor: Colors.black,
//         decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: logoColor),
//                 borderRadius: BorderRadius.circular(10)),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(width: 3),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             hintText: "Email",
//             prefixIcon: Icon(
//               Icons.email,
//               color: logoColor,
//             )),
//       ),
//     );
//   }
// }
