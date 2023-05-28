import 'dart:async';

import 'package:demo2/log%20in/logIn.dart';
import 'package:demo2/log%20in/user.dart';
import 'package:demo2/sign%20up/verifyUserByOTP.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

//asdsadsa
final _firebase = FirebaseAuth.instance;

class SignUpForUser extends StatefulWidget {
  @override
  State<SignUpForUser> createState() => SignUpForUserChild();
}

class SignUpForUserChild extends State<SignUpForUser> {
  final _signUpFormKey = GlobalKey<FormState>();
  static bool isEmailVerified = false;
  Timer? timer;

  TextEditingController _userNameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  String get username => this._userNameController.text.trim();

  String get email => this._emailController.text.trim();

  String get phoneNumber => this._phoneNumberController.text.trim();

  String get password => _passwordController.text.trim();
  EmailOTP myauth = EmailOTP();

  @override
  void dispose() {
    _passwordController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    timer?.cancel();
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

  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height - AppBar().preferredSize.height - mediaQuery.padding.top,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: _signUpFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: height * 0.15, //logo size
                      width: width * 0.7,
                      child: Image.asset(
                        "assets/signUpForUsersImage.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const SizedBox(
                      height: 50,
                      child: Text(
                        'Create An Account',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-z,A-z]'))
                        ],
                        controller: _userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "field must not be empty";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "User Name",
                            prefixIcon: const Icon(
                              Icons.account_circle,
                              color: logoColor,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 51, 47, 47)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: logoColor))),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    SizedBox(
                      height: 75,
                      child: TextFormField(
                        validator: checkPhoneNumber,
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            hintText: "Phone number",
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: logoColor,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 51, 47, 47)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: logoColor))),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    SizedBox(
                      height: 75,
                      child: TextFormField(
                        validator: checkEmail,
                        controller: _emailController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: logoColor,
                            ),
                            hintText: "Email",
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 51, 47, 47)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: logoColor))),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    SizedBox(
                      height: 75,
                      child: TextFormField(
                        validator: checkPassword,
                        controller: _passwordController,
                        obscureText: isHidden,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "password",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: logoColor,
                            ),
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 51, 47, 47)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: logoColor)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isHidden) {
                                    isHidden = false;
                                  } else {
                                    isHidden = true;
                                  }
                                });
                              },
                              icon: Icon(isHidden == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              color: logoColor,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: width * 0.6,
                height: height * 0.05,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_signUpFormKey.currentState!.validate()) {
                      final username = _userNameController.text;
                      final phoneNumber = _phoneNumberController.text;
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      myauth.setConfig(
                          appEmail: "ahmed.alkhatib13@gmail.com",
                          appName: "Email OTP",
                          userEmail: email,
                          otpLength: 4,
                          otpType: OTPType.digitsOnly);
                      if (await myauth.sendOTP() == true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("OTP has been sent"),
                        ));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTP(
                                    email: email,
                                    pass: password,
                                    otp: myauth,
                                    phoneNumber: phoneNumber,
                                    userName: username,
                                  )),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Oops, OTP send failed"),
                        ));
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
        ));
  }
}
