import 'package:demo2/chairty%20page/charitypage.dart';
import 'package:flutter/material.dart';

class Charitytiles extends StatelessWidget {
  String charityName;
  String location;
  String bio;
  String imageUrl;
  String charityID;
  int donersNumber;
  Charitytiles(
      {required this.charityName,
      required this.location,
      required this.bio,
      required this.charityID,
      required this.imageUrl,
      required this.donersNumber});
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
                builder: (context) => Charitypage(
                      charityName: charityName,
                      location: location,
                      bio: bio,
                      charityID: charityID,
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
                height: 110,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
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
                      "Number of benifactors: $donersNumber",
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
