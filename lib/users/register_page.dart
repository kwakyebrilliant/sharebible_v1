import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebible/utility/buttons/large_button.dart';
import 'package:sharebible/utility/textformfield/textformfield.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text controllers
  final _usernameController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      try {
        // Create user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Add user details
        addUserDetails(
          _usernameController.text.trim(),
          _fullnameController.text.trim(),
          _emailController.text.trim(),
        );

        // Registration successful, pop the loading circle
        Navigator.of(context).pop();

        // Registration successful, show an alert
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                textAlign: TextAlign.center,
                "Registration Successful",
              ),
              content: const Text(
                textAlign: TextAlign.center,
                "You have been successfully registered.",
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      } catch (e) {
        // Show an alert for the error if needed
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(textAlign: TextAlign.center, "Error"),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(textAlign: TextAlign.center, "Close"),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Passwords do not match, show an alert
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              textAlign: TextAlign.center,
              "Passwords Do Not Match",
            ),
            content: const Text(
              textAlign: TextAlign.center,
              "Please make sure your passwords match.",
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  Future addUserDetails(String userName, String fullName, String email) async {
    try {
      // Get the currently logged in user
      User? user = FirebaseAuth.instance.currentUser;

      // Check if a user is logged in
      if (user != null) {
        // Create a reference to the user's document in Firestore
        DocumentReference userRef = FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid);

        // Set the user details
        await userRef.set({
          'user name': userName,
          'full name': fullName,
          'email': email,
        });
      }
    } catch (e) {
      print("Error saving user details: $e");
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF607D8B), Color(0xFF000000)],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // First Expanded for sharebible text and logo
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share, color: Color(0xFFFFFFFF)),
                          Text(
                            'ShareBible',
                            style: GoogleFonts.inter(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Sign-Up form and content
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Sign Up text
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              'Sign Up.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),

                          // Already have an account text
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: GoogleFonts.inter(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: widget.showLoginPage,
                                  child: const Text(
                                    ' Login',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Form container
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              child: Column(
                                children: [
                                  MyTextFormField(
                                    labelText: '@username',
                                    icon: Icons.alternate_email_rounded,
                                    obscureText: false,
                                    controller: _usernameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Username is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  MyTextFormField(
                                    labelText: 'Full name',
                                    icon: Icons.person_rounded,
                                    obscureText: false,
                                    controller: _fullnameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Full name is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  MyTextFormField(
                                    labelText: 'Email Address',
                                    icon: Icons.email_outlined,
                                    obscureText: false,
                                    controller: _emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  MyTextFormField(
                                    labelText: 'Password',
                                    icon: Icons.lock_outline,
                                    suffixIcon: Icons.remove_red_eye_outlined,
                                    obscureText: true,
                                    controller: _passwordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  MyTextFormField(
                                    labelText: 'Confirm Password',
                                    icon: Icons.password_rounded,
                                    suffixIcon: Icons.remove_red_eye_outlined,
                                    obscureText: true,
                                    controller: _confirmpasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Confirm Password is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            style: GoogleFonts.inter(
                                              height: 1.1,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    'By clicking "Sign Up" below, I agree to ShareBible \n',
                                                style: GoogleFonts.inter(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Terms & Conditions ',
                                                style: GoogleFonts.inter(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'and ',
                                                style: GoogleFonts.inter(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Privacy Policy',
                                                style: GoogleFonts.inter(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 30.0,
                                    ),
                                    child: LargeButton(
                                      text: 'Sign up',
                                      function: () {
                                        if (_formKey.currentState!.validate()) {
                                          signUp();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
