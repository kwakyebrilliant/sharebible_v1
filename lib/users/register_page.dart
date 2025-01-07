import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebible/users/login_page.dart';
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

  // Navigate to login screen function
  void navigateToLogIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(showRegisterPage: () {}),
      ),
    );
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
                          // Sign Up text here wrapped in a padding
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),

                            // Sign Up text here
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

                          // Already have account text wrapped in a padding
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

                                  // Login
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

                          // Padding wrapped around container for register items
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),

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
                                  // Username textformfield here
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

                                  // Fullname textformfield here
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

                                  // Password textformfield here
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

                                  // Confirm Password textformfield here
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
                                      function: () {},
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
