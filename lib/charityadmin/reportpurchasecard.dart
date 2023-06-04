import 'package:demo2/administrator/cardapprovalpage.dart';
import 'package:demo2/chairty%20page/charitypage.dart';
import 'package:demo2/charityadmin/charityadminmain.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

//ADD THE NEW CHARITY HERE FOR APPROVAL

class Charityreportcard extends StatelessWidget {
  String? charityName;
  String? username;
  String? productName;
  String cost;

  Charityreportcard(
      {required this.charityName,
      required this.username,
      required this.productName,
      required this.cost});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: height * 0.08,
      child: InkWell(
        onTap: () {},
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
                      productName!,
                      style: TextStyle(fontSize: height * 0.02),
                    ),
                    Text(
                      username!,
                      style: TextStyle(fontSize: height * 0.02),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  cost,
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
