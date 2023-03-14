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
        title: Text("Choose a Catagory"),
        backgroundColor: logoColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //spacinggggggggggggg/////////////////////
              Container(
                color: Color.fromRGBO(120, 193, 248, 1),
                width: width,
                child: Text(
                  "Give To The Community",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              Container(
                width: width,
                color: Color.fromRGBO(120, 193, 248, 1),
                height: height * 0.25,
                child: IconButton(
                  icon: Image.asset(
                    'assets/volunteermainpageicon.png',
                    fit: BoxFit.fill,
                  ),
                  iconSize: 200,
                  onPressed: () {},
                ),
              ),

              //spacingggggg////////
              Container(
                color: Color.fromRGBO(255, 255, 255, 1),
                width: width,
                child: Text(
                  "Save A Life",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
              ),
              Container(
                width: width,
                color: Color.fromRGBO(255, 255, 255, 1),
                height: height * 0.25,
                child: IconButton(
                  icon: Image.asset(
                    'assets/medicaldonationmainpageicon.png',
                    fit: BoxFit.fill,
                  ),
                  iconSize: 300,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mainpagesearch()),
                    );
                  },
                ),
              ),

              Container(
                color: Color.fromRGBO(254, 95, 95, 1),
                width: width,
                child: Text(
                  "Donate to Charity",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              Container(
                width: width,
                color: Color.fromRGBO(254, 95, 95, 1),
                height: height * 0.25,
                child: IconButton(
                  icon: Image.asset(
                    'assets/donation_main_page_icon.png',
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
