import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';

class MainPageNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageNavigatorChild();
  }
}

class MainPageNavigatorChild extends State<MainPageNavigator> {
  int pageIndex = 0;
  final pages = [
    new MainPage(),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.black,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
            currentIndex: pageIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: logoColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: "search",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: "settings",
              )
            ],
            onTap: (value) {
              setState(() {
                pageIndex = value;
              });
            }),
      ),
      body: pages[pageIndex],
    );
  }
}
