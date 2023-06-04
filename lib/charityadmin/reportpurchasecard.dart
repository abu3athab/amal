import 'package:demo2/administrator/cardapprovalpage.dart';
import 'package:demo2/chairty%20page/charitypage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

//ADD THE NEW CHARITY HERE FOR APPROVAL

class Charityreportcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: height * 0.08,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Cardapprovalpage()),
          // );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Winter Clothing",
                      style: TextStyle(fontSize: height * 0.02),
                    ),
                    Text(
                      "Hisham abuhamra",
                      style: TextStyle(fontSize: height * 0.02),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "15",
                  style: TextStyle(fontSize: 25),
                ),
                Text(" JOD", style: TextStyle(fontSize: 25)),
                SizedBox(
                  width: 10,
                ),
                Image.asset("assets/charity.gif")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
