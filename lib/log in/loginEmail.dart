import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';

class LogInEmail extends StatelessWidget {
  FocusNode labelTextNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(15),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: logoColor),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Email",
            prefixIcon: Icon(
              Icons.email,
              color: logoColor,
            )),
      ),
    );
  }
}
