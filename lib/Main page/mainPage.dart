import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageChild();
  }
}

class MainPageChild extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainpagesearch()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons
                .account_circle_rounded), //to be changed to user account picute
            onPressed: () {},
          )
        ],
        title: Text("AMAL"),
        backgroundColor: logoColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Donate to Charity",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                width: width,
                height: height * 0.25,
                child: IconButton(
                  icon: Image.asset(
                    'assets/doantemainpagecard.jpg',
                    fit: BoxFit.fill,
                  ),
                  iconSize: 200,
                  onPressed: () {},
                ),
              ),
              Text(
                "Save lives",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                width: width,
                height: height * 0.25,
                child: IconButton(
                  icon: Image.asset(
                    'assets/doantemainpagecard.jpg',
                    fit: BoxFit.fill,
                  ),
                  iconSize: 200,
                  onPressed: () {},
                ),
              ),
              Text(
                "give to The Communinty",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              Container(
                width: width,
                height: height * 0.25,
                child: IconButton(
                  icon: Image.asset(
                    'assets/doantemainpagecard.jpg',
                    fit: BoxFit.fill,
                  ),
                  iconSize: 200,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
