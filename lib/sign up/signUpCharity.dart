import 'package:flutter/material.dart';

class SignUpChartiy extends StatelessWidget {
  const SignUpChartiy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        TextField(
          decoration: InputDecoration(labelText: 'Charity Name'),
        ),
        TextField(),
      ]),
    );
  }
}
