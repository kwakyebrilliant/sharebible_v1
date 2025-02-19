import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebible/users/forgot_password.dart';
import 'package:sharebible/utility/buttons/large_button.dart';
import 'package:sharebible/utility/textformfield/textformfield.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Sign In function
  Future signIn() async {
    // Display a loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Authentication was successful, pop the loading circle
      Navigator.of(context).pop();
    } catch (e) {
      // Authentication failed, pop the loading circle
      Navigator.of(context).pop();

      // Show an alert with the error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              textAlign: TextAlign.center,
              'Authentication Error',
            ),
            content: const Text(
              textAlign: TextAlign.center,
              "Email or Password incorrect",
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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

              // Padding here
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),

                child: Column(
                  children: [
                    // First Expanded for sharebible text and logo
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.share, color: Color(0xFFFFFFFF)),
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
                            // Padding around Header text
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),

                              // Header text here
                              child: Text(
                                'Welcome Back.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),

                            // Richtext wrapped in a padding
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),

                              // Richtext here
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  style: GoogleFonts.inter(height: 1.1),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Let\'s Sign you in \n',
                                      style: GoogleFonts.inter(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'You\'ve been missed!',
                                      style: GoogleFonts.inter(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withAlpha(50),
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                child: Column(
                                  children: [
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 30.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return const ForgotPaaword();
                                                  },
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Forgot Password?',
                                              style: GoogleFonts.inter(
                                                fontSize: 12.0,
                                                color: Color(0xFFFFFFFF),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: LargeButton(
                                        text: 'Sign In',
                                        function: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            signIn();
                                          }
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 30.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Don\'t have an account yet?',
                                            style: GoogleFonts.inter(
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: widget.showRegisterPage,
                                            child: const Text(
                                              ' Register Now',
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.inter(height: 1.1),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'By clicking "Sign In" above, you agree to ShareBible ',
                                style: GoogleFonts.inter(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms & \n ',
                                style: GoogleFonts.inter(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              TextSpan(
                                text: 'Conditions ',
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
                                  color: Theme.of(context).colorScheme.primary,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
