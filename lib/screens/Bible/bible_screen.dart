import 'package:flutter/material.dart';

class BibleScreen extends StatelessWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List to store the Bible books in order
    List<String> bibleBooks = [];

    List<String> filteredBooks = [];

    //search controller
    TextEditingController searchController = TextEditingController();

    // Default Bible version
    String selectedVersion = 'KJV';
    List<String> availableVersions = ['KJV', 'ASV', 'WEB', 'NET'];

    return const Placeholder();
  }
}
