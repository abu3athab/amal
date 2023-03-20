import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';

class ProfilePageNavigator extends StatefulWidget {
  const ProfilePageNavigator({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProfilePageNavigatorChild();
  }
}

class ProfilePageNavigatorChild extends State<ProfilePageNavigator> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.65,
      height: height * 0.1,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
              child: Column(
                children: [
                  IconButton(
                    iconSize: height * 0.04,
                    icon: const Icon(
                      Icons.account_circle,
                      color: logoColor,
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                  Text("Profile")
                ],
              ),
            )),
            VerticalDivider(width: 1.0),
            Expanded(
                child: Center(
              child: Column(
                children: [
                  IconButton(
                    iconSize: height * 0.04,
                    icon: const Icon(
                      Icons.volunteer_activism,
                      color: logoColor,
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                  Text("Badges")
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
