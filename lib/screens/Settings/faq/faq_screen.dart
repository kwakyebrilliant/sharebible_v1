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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding around top items
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),

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

                  // FAQ here
                  FAQList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQList extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is Flutter?',
      answer:
          'Flutter is an open-source UI software development toolkit created by Google. It is used to build natively compiled applications for mobile, web, and desktop from a single codebase.',
    ),
    FAQItem(
      question: 'How do I install Flutter?',
      answer:
          'You can install Flutter by following the installation instructions provided in the official Flutter documentation: https://flutter.dev/docs/get-started/install',
    ),
    FAQItem(
      question: 'How do I install Flutter?',
      answer:
          'You can install Flutter by following the installation instructions provided in the official Flutter documentation: https://flutter.dev/docs/get-started/install',
    ),
    FAQItem(
      question: 'How do I install Flutter?',
      answer:
          'You can install Flutter by following the installation instructions provided in the official Flutter documentation: https://flutter.dev/docs/get-started/install',
    ),
    FAQItem(
      question: 'How do I install Flutter?',
      answer:
          'You can install Flutter by following the installation instructions provided in the official Flutter documentation: https://flutter.dev/docs/get-started/install',
    ),
  ];

  FAQList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
            faqItems.map((item) {
              return FAQItemWidget(item: item);
            }).toList(),
      ),
    );
  }
}

class FAQItemWidget extends StatefulWidget {
  final FAQItem item;

  const FAQItemWidget({super.key, required this.item});

  @override
  _FAQItemWidgetState createState() => _FAQItemWidgetState();
}

class _FAQItemWidgetState extends State<FAQItemWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 20.0,
        right: 20.0,
      ),
      child: ExpansionTile(
        title: Text(
          widget.item.question,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        initiallyExpanded: isExpanded,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.item.answer),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
