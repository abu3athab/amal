import 'package:flutter/material.dart';

class SignUpTextBox extends StatelessWidget {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nationalIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "username",
                border: OutlineInputBorder(),
              ),
            )),
        Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "email",
                border: OutlineInputBorder(),
              ),
            )),
        Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "phone number",
                border: OutlineInputBorder(),
              ),
            )),
        Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nationalIDController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "national ID",
                border: OutlineInputBorder(),
              ),
            ))
      ])),
    );
  }
}
