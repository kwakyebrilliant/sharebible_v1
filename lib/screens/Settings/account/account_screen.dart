import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebible/utility/buttons/large_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // AppBar starts here
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).colorScheme.secondary.withValues(alpha: 0.4),
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_left_rounded,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 50.0,
          ),
        ),
      ),
      // AppBar ends here

      // Body starts here
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Form(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),

              // Padding around align
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),

                // Align here
                child: Align(
                  alignment: Alignment.bottomCenter,

                  // Button here
                  child: LargeButton(text: 'Save', function: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
