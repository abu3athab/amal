import 'package:demo2/volunteer%20page/eventinfo.dart';
import 'package:flutter/material.dart';

class Eventtile extends StatelessWidget {
  String name;
  String date;
  String startTime;
  String finishTime;
  String location;
  String desc;
  Eventtile(
      {required this.name,
      required this.date,
      required this.startTime,
      required this.finishTime,
      required this.location,
      required this.desc});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: height * 0.16,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Eventinfo(
                      name: name,
                      startTime: startTime,
                      endTime: finishTime,
                      loca: location,
                      desc: desc,
                    )),
          );
        },
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
                    "assets/Community-Donation-Drive-Feature-Image-01.webp"),
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
      ),
    );
  }
}
