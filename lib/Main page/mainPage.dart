import 'dart:ffi';

import 'package:demo2/Main%20page/mainpagesearch.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/profilepage.dart/profile.dart';
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
      backgroundColor: Colors.white,

      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Text(""),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
        title: Text(
          "Welcome to Amal",
          textAlign: TextAlign.center,
        ),
        backgroundColor: logoColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: 200,
                padding: new EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mainpagesearch()),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: logoColor,
                    elevation: 10,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        "Quote of The Day ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Container(
                        width: width,
                        height: 20,
                      ),
                      Text(
                        "Kindness is giving hope to those who think they are all alone in this world.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(247, 170, 137, 1)),
                      ),
                    ]),
                  ),
                ),
              ),
              Text(
                "Charity",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mainpagesearch()),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: height * 0.12,
                  child: Card(
                    color: Color.fromRGBO(254, 95, 95, 1),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image:
                              AssetImage('assets/donation_main_page_icon.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/girlportrait.jpeg'),
                      radius: height * 0.04,
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(255, 255, 255, 0.15)),
                  padding: EdgeInsets.all(7),
                  width: width,
                  height: height * 0.09,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.01,
                        height: 2,
                      ),
                      Container(
                        width: width * 0.7,
                        child: TextField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                            hintText: 'Try Food,Clothes..',
                          ),
                          style: TextStyle(fontSize: height * 0.035),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: IconButton(
                          iconSize: width * 0.07,
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 15),
              width: width,
              height: height * 0.6,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.001,
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/charityPic.png'),
                                radius: width * 0.13,
                              ),
                              Text(
                                "Charity",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/illustration-person-donating-blood_23-2148236971.jpg'),
                                radius: width * 0.13,
                              ),
                              Text(
                                "Blood donation",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/Community-Donation-Drive-Feature-Image-01.webp'),
                                radius: width * 0.13,
                              ),
                              Text(
                                "Volunteer",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.001,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
