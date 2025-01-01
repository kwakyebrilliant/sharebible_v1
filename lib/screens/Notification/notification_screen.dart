import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // Customescrollview for all content
      body: CustomScrollView(
        slivers: [
          // sliverappbar statrts here
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,

            // Title starts here
            title: Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
