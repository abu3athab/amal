import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignUpChartiy extends StatefulWidget {
  const SignUpChartiy({Key? key}) : super(key: key);

  @override
  State<SignUpChartiy> createState() => _SignUpChartiyState();
}

class _SignUpChartiyState extends State<SignUpChartiy> {
  final _formKey = GlobalKey<FormState>();
  final _charityNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void dispose() {
    _charityNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up for Charity'),
        centerTitle: true,
        backgroundColor: logoColor,
        elevation: 0,
      ),
      body: Container(
        height: height - AppBar().preferredSize.height - mediaQuery.padding.top,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter your charity details:',
                style: theme.textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(children: [
                  TextFormField(
                    controller: _charityNameController,
                    decoration: InputDecoration(
                        labelText: 'Charity Name',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 59, 56, 56)),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: logoColor))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your charity name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 59, 56, 56)),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: logoColor))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 59, 56, 56)),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: logoColor))),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(
                        labelText: 'Location',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 59, 56, 56)),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: logoColor))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your location';
                      }
                      return null;
                    },
                  ),
                ]),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    // Save the form data and navigate to the next screen
                    final charityName = _charityNameController.text;
                    final phoneNumber = _phoneNumberController.text;
                    final email = _emailController.text;
                    final location = _locationController.text;

                    // TODO: save the data and navigate to the next screen
                  }
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: logoColor,
                  minimumSize: Size(width, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
