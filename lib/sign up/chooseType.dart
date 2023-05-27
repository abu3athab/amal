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
      /*
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            // BoxDecoration takes the image
            decoration: BoxDecoration(
              // Image set to background of the body
              image: DecorationImage(
                  image: AssetImage("assets/hands.jpg"), fit: BoxFit.fill),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 30),
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child:
                          Text('user', style: TextStyle(color: Colors.black)),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                        backgroundColor: MaterialStateProperty.all(logoColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpChartiy()),
                        );
                      },
                      child: Text('organization',
                          style: TextStyle(color: Colors.black)),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                        backgroundColor: MaterialStateProperty.all(logoColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        */
    );
  }
}
