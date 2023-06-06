import 'package:demo2/colors.dart';
import 'package:demo2/volunteer%20page/eventinfo.dart';
import 'package:flutter/material.dart';

import 'adminEventInfo.dart';

class Charitytileview extends StatelessWidget {
  @override
  String name;
  String location;
  String imageUrl;
  Charitytileview(
      {required this.name, required this.location, required this.imageUrl});
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.95,
      height: height * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: [Colors.green, logoColor],
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width * 0.30,
                    child: FittedBox(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: height * 0.02, color: Colors.white),
                    ),
                    Text(
                      location,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
