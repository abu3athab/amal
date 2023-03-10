import 'package:flutter/material.dart';

class LogInEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(15),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: Color.fromARGB(255, 24, 102, 26)),
                borderRadius: BorderRadius.circular(10)),
            labelText: "email"),
      ),
    );
  }
}
