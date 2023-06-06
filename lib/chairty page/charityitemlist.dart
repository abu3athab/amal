import 'dart:io';

import 'package:demo2/chairty%20page/charitypage.dart';
import 'package:demo2/chairty%20page/productpage.dart';
import 'package:flutter/material.dart';

class Charityitems extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String desc;
  final double cost;
  final String categ;
  final String itemID;
  final String charityID;

  Charityitems(
      {required this.imageUrl,
      required this.name,
      required this.desc,
      required this.cost,
      required this.categ,
      required this.itemID,
      required this.charityID});

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
                builder: (context) => Productpage(
                      imageUrl: imageUrl,
                      name: name,
                      desc: desc,
                      categ: categ,
                      cost: cost,
                      itemID: itemID,
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
                child: Image.network(imageUrl),
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
                    SizedBox(
                      height: height * 0.005,
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Spacer(),
                    Text(
                      "price: ${cost} Jod",
                      style: TextStyle(fontSize: height * 0.02),
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
