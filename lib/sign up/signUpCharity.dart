import 'dart:async';

import 'package:demo2/colors.dart';
import 'package:demo2/sign%20up/sendCharityUserOTP.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../log in/logIn.dart';
import '../log in/user.dart';
import 'enterCharitydetails.dart';

class SignUpChartiy extends StatefulWidget {
  SignUpChartiy({Key? key}) : super(key: key);

  @override
  State<SignUpChartiy> createState() => _SignUpChartiyState();
}

class _SignUpChartiyState extends State<SignUpChartiy> {
  EmailOTP auth = EmailOTP();
  final _formKey = GlobalKey<FormState>();
  final _firebase = FirebaseAuth.instance;
  static bool isEmailVerified = false;
  Timer? timer;

  final _charityNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isHidden = true;

  @override
  void dispose() {
    _charityNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    _passwordController.dispose();
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

  String? checkEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "email field must not be empty";
    } else if (!EmailValidator.validate(email)) {
      return "email isn't valid";
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
                      validator: checkEmail),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: _isHidden,
                    controller: _passwordController,
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
                ]),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Charitydetails()),
                    );
                  },
                  child: Text("bypass")),
              Container(
                margin: const EdgeInsets.all(20),
                width: width * 0.6,
                height: height * 0.05,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() == true) {
                      // Save the form data and navigate to the next screen
                      final charityUserName = _charityNameController.text;
                      final phoneNumber = _phoneNumberController.text;
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final _firebase = FirebaseAuth.instance;

                      // TODO: save the data and navigate to the next screen

                      auth.setConfig(
                          appEmail: "me@rohitchouhan.com",
                          appName: "Email OTP",
                          userEmail: email,
                          otpLength: 4,
                          otpType: OTPType.digitsOnly);
                      if (await auth.sendOTP() == true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("OTP has been sent"),
                        ));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CharityOTP(
                                    auth: auth,
                                    userName: charityUserName,
                                    email: email,
                                    password: password,
                                    phoneNumber: phoneNumber,
                                  )),
                        );
                      }
                    }
                  },

                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),

                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(logoColor)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
