import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';

class LogInPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LogInPasswordChild();
  }
}

class LogInPasswordChild extends State<LogInPassword> {
  FocusNode labelTextNode = new FocusNode();
  var isHidden = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(15),
        child: TextField(
          obscureText: isHidden,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: "Password",
              labelStyle: TextStyle(
                  color: labelTextNode.hasFocus
                      ? Colors.black
                      : Color.fromARGB(255, 51, 47, 47)),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: logoColor)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Color.fromARGB(255, 24, 102, 26)),
                  borderRadius: BorderRadius.circular(10)),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (isHidden) {
                      isHidden = false;
                    } else {
                      isHidden = true;
                    }
                  });
                },
                icon: Icon(
                    isHidden == true ? Icons.visibility_off : Icons.visibility),
                color: logoColor,
              )),
        ));
  }
}
