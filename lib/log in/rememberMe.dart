import 'package:flutter/material.dart';
import 'package:demo2/colors.dart';

class RememberMe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Child();
  }
}

class Child extends State<RememberMe> {
  bool valuefirst = false;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        height: 25,
        width: 25,
        child: Checkbox(
          value: this.valuefirst,
          onChanged: (value) {
            setState(() {
              if (value == true) {
                this.valuefirst = true;
              } else {
                this.valuefirst = false;
              }
            });
          },
          activeColor: logoColor,
          checkColor: Colors.black,
          overlayColor: MaterialStateProperty.all(Colors.white),
          tristate: false,
        ),
      ),
      const Text(
        "Remember me",
        style: TextStyle(fontWeight: FontWeight.w600),
      )
    ]);
  }
}
