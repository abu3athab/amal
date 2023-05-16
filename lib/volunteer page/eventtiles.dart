import 'package:flutter/material.dart';

class Eventtile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: height * 0.15,
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
                  "assets/drawn-clothing-donation-concept-illustrated_23-2148833206.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Park cleaning",
                    style: TextStyle(fontSize: width * 0.05),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Text(
                    "Date: march 7th",
                    style: TextStyle(fontSize: width * 0.03),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  Text(
                    "Time: 9:00 AM",
                    style: TextStyle(fontSize: width * 0.03),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  Text(
                    "Amman Jubiha",
                    style: TextStyle(fontSize: width * 0.05),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  Text(
                    "Click to view info",
                    style: TextStyle(fontSize: width * 0.03),
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
