import 'package:flutter/material.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height - AppBar().preferredSize.height - mediaQuery.padding.top,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Enter your charity details:',
                  style: theme.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _charityNameController,
                  decoration: InputDecoration(
                    labelText: 'Charity Name',
                    border: OutlineInputBorder(),
                  ),
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
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
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
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _bioController,
                  decoration: InputDecoration(
                    labelText: 'Charity Biography',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your charity biography';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),            
                ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  // Save the form data and navigate to the next screen
                  final charityName = _charityNameController.text;
                  final phoneNumber = _phoneNumberController.text;
                  final email = _emailController.text;
                  final location = _locationController.text;
                  final bio = _bioController.text;
                  // TODO: save the data and navigate to the next screen
                }
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(width, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                primary: theme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);}}