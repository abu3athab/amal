import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors.dart';

class SignUpForUser extends StatefulWidget {
  @override
  State<SignUpForUser> createState() => _SignUpForUserChild();
}

class _SignUpForUserChild extends State<SignUpForUser> {
  final _signUpFormKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();
  @override
  void dispose() {
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

  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Center(
          child: SizedBox(
            child: Form(
              key: _signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: height * 0.25, //logo size
                    width: width * 0.8,
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
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            new RegExp(r'[a-z,A-z]'))
                      ],
                      controller: _userNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "field must not be empty";
                        }
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "User Name",
                          border: OutlineInputBorder(),
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 51, 47, 47)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: logoColor))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      validator: checkPhoneNumber,
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(new RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Phone Number",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 51, 47, 47)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: logoColor))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email must not be empty";
                        }
                      },
                      controller: _emailController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 51, 47, 47)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: logoColor))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 51, 47, 47)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
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
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 230,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_signUpFormKey.currentState?.validate() == true) {
                          // Save the form data and navigate to the next screen
                          final username = _userNameController.text;
                          final phoneNumber = _phoneNumberController.text;
                          final email = _emailController.text;
                          final location = _passwordController.text;

                          // TODO: save the data and navigate to the next screen
                        }
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),

                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStateProperty.all(logoColor)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
