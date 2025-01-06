import 'package:flutter/material.dart';
import 'package:sharebible/users/login_page.dart';
import 'package:sharebible/utility/buttons/large_button.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Log In button here
            LargeButton(
              text: 'Sign In',
              function: () {
                navigateToLogIn(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
