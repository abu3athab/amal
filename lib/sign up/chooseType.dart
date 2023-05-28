import 'package:demo2/sign%20up/signUp.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import 'signUpCharity.dart';

class Choose extends StatelessWidget {
  const Choose({Key? key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: width,
                  height: height,
                  child: Column(children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.circle,
                            size: 20,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                        Opacity(
                          opacity: 0.3,
                          child: IconButton(
                            icon: Icon(
                              Icons.circle,
                              size: 20,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    Container(
                        width: width * 0.8,
                        child: Image.asset("assets/man.gif")),
                    Text(
                      "Individual",
                      style:
                          TextStyle(fontSize: width * 0.1, color: Colors.blue),
                    ),
                    Text(
                      "Choose to be the one",
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                    Text("that goes out of there way",
                        style: TextStyle(fontSize: width * 0.05)),
                    Text("to make a difference ",
                        style: TextStyle(fontSize: width * 0.05)),
                    SizedBox(height: height * 0.2),
                    SizedBox(
                      width: width * 0.5,
                      height: height * 0.06,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Text("Choose"),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )))),
                    )
                  ]),
                ),
                /////////////////////////
                Container(
                  width: width,
                  height: height,
                  child: Column(children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Opacity(
                          opacity: 0.3,
                          child: IconButton(
                            icon: Icon(
                              Icons.circle,
                              size: 20,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Opacity(
                          opacity: 1,
                          child: IconButton(
                            icon: Icon(
                              Icons.circle,
                              size: 20,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    Container(
                        width: width * 0.8,
                        child: Image.asset("assets/charity.gif")),
                    Text(
                      "Charity",
                      style:
                          TextStyle(fontSize: width * 0.1, color: Colors.blue),
                    ),
                    Text(
                      "Choose to be the one",
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                    Text("who gives hope to people",
                        style: TextStyle(fontSize: width * 0.05)),
                    Text("who lost it",
                        style: TextStyle(fontSize: width * 0.05)),
                    SizedBox(height: height * 0.2),
                    SizedBox(
                      width: width * 0.5,
                      height: height * 0.06,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpChartiy()),
                            );
                          },
                          child: Text("Choose"),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )))),
                    ),
                  ]),
                ),
              ],
            )),
      ),
    );
  }
}

/*
import 'package:demo2/sign%20up/signUp.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import 'signUpCharity.dart';

class Choose extends StatelessWidget {
  const Choose({Key? key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("choose account type"),
        backgroundColor: logoColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Container(
              width: width,
              height: height * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "assets/flat-world-humanitarian-day-illustration-with-person-holding-aid-box_23-2149459659 (1).png"),
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 0.08,
              child: TextButton(
                child: Text("Sign Up as indiviual"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(logoColorsec),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(16)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: logoColorsec)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
              ),
            ),
            Container(
              width: width,
              height: height * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/flat-illustration-world-humanitarian-day_23-2149484207 (1).png'),
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 0.08,
              child: TextButton(
                child: Text("Sign Up as charity"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(logoColorsec),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(17)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: logoColorsec)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpChartiy()),
                  );
                },
              ),
            ),
            Container(
              width: width,
              height: 150,
              color: logoColor,
            )
          ]),
        ),
      ),
    );
  }
}
*/