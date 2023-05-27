import 'package:demo2/Main%20page/mainPage.dart';
import 'package:demo2/colors.dart';
import 'package:demo2/settings%20page/set.dart';
import 'package:demo2/settings%20page/settingspage.dart';
import 'package:flutter/material.dart';

import '../profilepage.dart/profile.dart';

class MainPageNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageNavigatorChild();
  }
}

class MainPageNavigatorChild extends State<MainPageNavigator> {
  int pageIndex = 0;
  final pages = [new MainPage(), new Settings(), new Profile(), new Config()];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: availableHeight * 0.1,
          child: BottomNavigationBar(
              currentIndex: pageIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white.withOpacity(1),
              unselectedItemColor: Colors.white.withOpacity(0.5),
              backgroundColor: Colors.lightGreen,
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
      ),
    );
  }
}
