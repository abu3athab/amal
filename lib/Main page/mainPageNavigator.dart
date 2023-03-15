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
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 170, 163, 163),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: logoColor,
              ),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: logoColor,
              ),
              label: "search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: logoColor,
              ),
              label: "settings",
            )
          ],
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          }),
      body: pages[pageIndex],
    );
  }
}
