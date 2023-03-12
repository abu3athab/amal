import 'package:demo2/sign%20up/signUp.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class Choose extends StatelessWidget {
  const Choose({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("choose account type"),
          backgroundColor: logoColor,
        ),
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
                      onPressed: null,
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
        ));
  }
}
