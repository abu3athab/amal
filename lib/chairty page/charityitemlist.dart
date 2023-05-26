import 'package:demo2/chairty%20page/charitypage.dart';
import 'package:flutter/material.dart';

class Charityitems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: height * 0.161,
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 10,
          child: Row(
            children: [
              Container(
                child: Image.asset("assets/fashion.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "T-shirt for one child",
                      style: TextStyle(fontSize: height * 0.02),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      "description : soft cotton T_shirt for children",
                      style: TextStyle(fontSize: height * 0.012),
                      softWrap: true,
                    ),
                    Spacer(),
                    Text(
                      "price: 5 Jod",
                      style: TextStyle(fontSize: height * 0.03),
                      softWrap: true,
                      maxLines: 2,
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
