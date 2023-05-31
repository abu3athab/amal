import 'package:flutter/material.dart';

class Eventtile extends StatelessWidget {
  String name;
  String date;
  String startTime;
  String location;
  Eventtile(
      {required this.name,
      required this.date,
      required this.startTime,
      required this.location});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: height * 0.16,
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
                    name,
                    style: TextStyle(fontSize: height * 0.02),
                  ),
                  Text(
                    date,
                    style: TextStyle(fontSize: height * 0.02),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  Text(
                    startTime,
                    style: TextStyle(fontSize: height * 0.02),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  Text(
                    location,
                    style: TextStyle(fontSize: height * 0.02),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  Text(
                    "Click to view info",
                    style: TextStyle(fontSize: height * 0.012),
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
