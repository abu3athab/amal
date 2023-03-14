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
      backgroundColor: Colors.white,
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
                  ),
                ),
              ),
              ///////////////////////////volunteering button
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Volunteering",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mainpagesearch()),
                          );
                        },
                        child: SizedBox(
                          width: width * 0.5,
                          height: height * 0.12,
                          child: Card(
                            color: Color.fromRGBO(119, 193, 248, 1),
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 10,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/volunteermainpageicon.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  /////////////////blood donation button
                  Column(
                    children: [
                      Text(
                        "Blood Donation",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mainpagesearch()),
                          );
                        },
                        child: SizedBox(
                          width: width * 0.5,
                          height: height * 0.12,
                          child: Card(
                            color: Colors.white,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 10,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/medicaldonationmainpageicon.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: width,
                height: 10,
              ),
              Container(
                width: width,
                height: 2,
                color: Colors.black,
              ),
              SizedBox(
                width: width,
                height: 5,
              ),
              Container(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Featured Charities",
                    style: TextStyle(fontSize: 23, color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),

              /*
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
              */
            ],
          ),
        ),
      ),
    );
  }
}
