import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // AppBar starts here
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        title: Text(
          'FAQs',
          style: TextStyle(
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

      // Body here
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding around top items
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Got questions text
                Text(
                  'Got Questions?',
                  style: GoogleFonts.inter(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
