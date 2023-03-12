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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(children: [
      SizedBox(
        width: width * 0.09,
        height: height * 0.09,
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
