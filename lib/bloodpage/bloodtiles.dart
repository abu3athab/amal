import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/bloodpage/bloodrequestinfo.dart';
import 'package:flutter/material.dart';

class Bloodtiles extends StatelessWidget {
  String location;
  String bloodType;
  String nOfUnits;
  Bloodtiles(
      {required this.location,
      required this.bloodType,
      required this.nOfUnits});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Bloodrequestindo(
                    location: location,
                    bloodType: bloodType,
                    nOfUnits: nOfUnits,
                  )),
        );
      },
      child: Container(
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
                      location!,
                      style: TextStyle(fontSize: height * 0.03),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      "Blood type: ${bloodType!}",
                      style: TextStyle(fontSize: height * 0.028),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      "requried units : ${nOfUnits!}",
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
      ),
    );
  }
}
