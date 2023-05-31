import 'package:demo2/administrator/cardApprovalCharity.dart';
import 'package:demo2/chairty%20page/charitypage.dart';
import 'package:flutter/material.dart';

class AdminCharitytiles extends StatelessWidget {
  String charityName;
  String location;
  String uid;
  String name;
  String email;
  String phoneNumber;
  AdminCharitytiles({
    required this.charityName,
    required this.location,
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: height * 0.161,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardApprovalCharity(
                      location: location,
                      uid: uid,
                      name: name,
                      phoneNumber: phoneNumber,
                      email: email,
                      charityName: charityName,
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
                child: Image.asset("assets/charity.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      charityName,
                      style: TextStyle(fontSize: height * 0.03),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      "location: $location",
                      style: TextStyle(fontSize: height * 0.02),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      "Number of benifactors: 19520",
                      style: TextStyle(fontSize: height * 0.012),
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
