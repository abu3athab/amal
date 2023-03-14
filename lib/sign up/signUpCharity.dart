import 'package:demo2/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

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
  final _password = TextEditingController();
  bool _isHidden = true;

  @override
  void dispose() {
    _charityNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    _password.dispose();
    super.dispose();
  }

  String? checkPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.toString().isEmpty) {
      return "field must not be empty";
    }

    if (phoneNumber.length != 10) {
      return "phone number should consist of 10 digits ";
    }
    if (!(phoneNumber.startsWith('079')) &&
        !(phoneNumber.startsWith('078')) &&
        !(phoneNumber.startsWith('077'))) {
      return "phone number should be Jordanian";
    } else {
      return null;
    }
  }

  String? checkPassword(String? pass) {
    if (pass == null || pass.isEmpty) {
      return "password field must not be empty";
    }
    if (pass.length < 8 || pass.length > 16) {
      return "password must between 8 and 16 character";
    }
    if (!pass.contains(RegExp(r"[a-z]"))) {
      return "password must contain at least one lower-case letter";
    }
    if (!pass.contains(RegExp(r"[A-Z]"))) {
      return "password must contain at least one upper-case letter";
    }
    if (!pass.contains(RegExp(r"[0-9]"))) {
      return "password must contain at least one number";
    }
    if (!pass.contains(RegExp(r'[!@#$%&*?]'))) {
      return "password must contain at least one of these special characters (!@#%^&*?)";
    } else {
      return null;
    }
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
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          new RegExp(r"[A-Z,a-z]")),
                    ],
                    decoration: InputDecoration(
                        hintText: "Charity name",
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: logoColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
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
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                          hintText: "Phone number",
                          prefixIcon: Icon(
                            Icons.phone,
                            color: logoColor,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: logoColor))),
                      validator: checkPhoneNumber),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(
                          Icons.mail,
                          color: logoColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
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
                    obscureText: _isHidden,
                    controller: _password,
                    decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: logoColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: logoColor,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isHidden) {
                                _isHidden = false;
                              } else {
                                _isHidden = true;
                              }
                            });
                          },
                          icon: Icon(_isHidden == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: logoColor,
                        )),
                    validator: checkPassword,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(
                        hintText: 'Location',
                        prefixIcon: Icon(
                          Icons.add_location_alt,
                          color: logoColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
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
