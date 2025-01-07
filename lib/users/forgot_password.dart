import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebible/utility/buttons/large_button.dart';
import 'package:sharebible/utility/textformfield/textformfield.dart';

class ForgotPaaword extends StatefulWidget {
  const ForgotPaaword({super.key});

  @override
  State<ForgotPaaword> createState() => _ForgotPaawordState();
}

class _ForgotPaawordState extends State<ForgotPaaword> {
  // Text controllers
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    // Display a loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      // Authentication was successful, pop the loading circle
      Navigator.of(context).pop();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(textAlign: TextAlign.center, 'Success Message'),
            content: const Text(
              textAlign: TextAlign.center,
              'Password reset link sent',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Close',
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
      // Authentication failed, pop the loading circle
      Navigator.of(context).pop();

      // Show an alert with the error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Authentication Error'),
            content: const Text("Email incorrect"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
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
              child: Column(
                children: [
                  // First Expanded for sharebible text and logo
                  Expanded(
                    child: Padding(
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
                  ),

                  // Second Expanded for other contents
                  Expanded(
                    flex: 8,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // GestureDetector wrapped around arrow left icon for back in a container
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                            //  Arrow left icon for back in a container
                            child: Container(
                              height: 32.0,
                              width: 32.0,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withValues(alpha: 0.7),
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.blueGrey,
                                ),
                              ),

                              // Arrow left icon for back centered
                              child: Center(
                                child: Icon(
                                  Icons.arrow_left_rounded,
                                  color: Color(0xFFFFFFFF),
                                  size: 28.0,
                                ),
                              ),
                            ),
                          ),

                          // Forgot password text here wrapped in a padding
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),

                            // Forgot password text here
                            child: Text(
                              'Forgot Pssword?.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),

                          // Padding wrapped around container for forgot password items
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),

                            // Container for forgot password items
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.blueGrey,
                                ),
                              ),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      textAlign: TextAlign.left,
                                      'When you forget your password, there is always a way to go about it.',
                                      style: GoogleFonts.inter(
                                        fontSize: 12.0,
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  // Email textformfield here
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

                                  // Padding around the centered Submit button
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 30.0,
                                    ),

                                    // Submit button centered
                                    child: Center(
                                      // Submit button here
                                      child: LargeButton(
                                        text: 'Submit',
                                        function: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            passwordReset();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
    );
  }
}
