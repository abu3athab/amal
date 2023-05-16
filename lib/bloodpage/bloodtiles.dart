import 'package:flutter/material.dart';

class Bloodtiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: height * 0.161,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Row(
          children: [
            Container(
              child: Image.asset(
                  "assets/illustration-person-donating-blood_23-2148236971.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amman jubiha",
                    style: TextStyle(fontSize: height * 0.03),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Text(
                    "Blood type: O+",
                    style: TextStyle(fontSize: height * 0.028),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Text(
                    "requried units : 4",
                    style: TextStyle(fontSize: height * 0.028),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Text(
                    "Click to view info",
                    style: TextStyle(fontSize: height * 0.01),
                    softWrap: true,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
