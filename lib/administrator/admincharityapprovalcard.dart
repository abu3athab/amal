import 'package:demo2/administrator/cardapprovalpage.dart';
import 'package:demo2/chairty%20page/charitypage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

//ADD THE NEW CHARITY HERE FOR APPROVAL

class Charity_admin_approval_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: height * 0.161,
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
          child: Row(
            children: [
              Container(
                child: Image.asset("assets/charity.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tikyat Um Ali",
                      style: TextStyle(fontSize: height * 0.03),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      "location: Amman",
                      style: TextStyle(fontSize: height * 0.02),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: height * 0.005,
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
