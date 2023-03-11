import 'package:flutter/material.dart';

class SignUpChartiy extends StatelessWidget {
  const SignUpChartiy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: const [
        TextField(
          decoration: InputDecoration(labelText: 'Charity Name'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Phone Number'),
        
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Loction'),
        ),
        TextField(decoration: InputDecoration(labelText: 'chartiy biography'),
        )
      ]),
    );
  }
}
