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
                // Header text here
                Text(
                  'Got Questions?',
                  style: GoogleFonts.inter(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                // Subheader text
                Text(
                  'Some answers to frequently asked questions.',
                  style: GoogleFonts.inter(
                    fontSize: 14.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                // Container wrapped in a padding
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),

                  // Container here
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    // Row for container items
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            top: 15.0,
                            bottom: 15.0,
                            right: 10.0,
                          ),
                          child: Container(
                            height: 35.0,
                            width: 35.0,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: const Icon(
                              Icons.question_answer_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        // Text within container here
                        const Text(
                          'Browse through these quick answers.',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blueGrey,
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
    );
  }
}
