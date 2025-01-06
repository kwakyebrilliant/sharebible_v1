import 'package:flutter/material.dart';
import 'package:sharebible/users/register_page.dart';
import 'package:sharebible/utility/buttons/large_button.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Navigate to register screen function
  void navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(showLoginPage: () {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Register button here
            LargeButton(
              text: 'Sign Up',
              function: () {
                navigateToRegister(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
