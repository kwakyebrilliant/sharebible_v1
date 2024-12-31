import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class BibleScreen extends StatefulWidget {
  const BibleScreen({super.key});

  @override
  State<BibleScreen> createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  // List to store the Bible books in order
  List<String> bibleBooks = [];

  List<String> filteredBooks = [];

  //search controller
  TextEditingController searchController = TextEditingController();

  // Default Bible version
  String selectedVersion = 'KJV';
  List<String> availableVersions = ['KJV', 'ASV', 'WEB', 'NET'];

  @override
  void initState() {
    super.initState();
    loadJsonData(selectedVersion).then((String jsonContent) {
      // Load JSON data for the selected version
      final jsonData = json.decode(jsonContent);
      final verses = jsonData['verses'];

      // Define a custom order for the Bible books based on their position
      final Map<String, int> bookOrder = {
        'Genesis': 1,
        'Exodus': 2,
        'Leviticus': 3,
        'Numbers': 4,
        'Deuteronomy': 5,
        'Joshua': 6,
        'Judges': 7,
        'Ruth': 8,
        '1 Samuel': 9,
        '2 Samuel': 10,
        '1 Kings': 11,
        '2 Kings': 12,
        '1 Chronicles': 13,
        '2 Chronicles': 14,
        'Ezra': 15,
        'Nehemiah': 16,
        'Esther': 17,
        'Job': 18,
        'Psalms': 19,
        'Proverbs': 20,
        'Ecclesiastes': 21,
        'Song of Solomon': 22,
        'Isaiah': 23,
        'Jeremiah': 24,
        'Lamentations': 25,
        'Ezekiel': 26,
        'Daniel': 27,
        'Hosea': 28,
        'Joel': 29,
        'Amos': 30,
        'Obadiah': 31,
        'Jonah': 32,
        'Micah': 33,
        'Nahum': 34,
        'Habakkuk': 35,
        'Zephaniah': 36,
        'Haggai': 37,
        'Zechariah': 38,
        'Malachi': 39,
        'Matthew': 40,
        'Mark': 41,
        'Luke': 42,
        'John': 43,
        'Acts': 44,
        'Romans': 45,
        '1 Corinthians': 46,
        '2 Corinthians': 47,
        'Galatians': 48,
        'Ephesians': 49,
        'Philippians': 50,
        'Colossians': 51,
        '1 Thessalonians': 52,
        '2 Thessalonians': 53,
        '1 Timothy': 54,
        '2 Timothy': 55,
        'Titus': 56,
        'Philemon': 57,
        'Hebrews': 58,
        'James': 59,
        '1 Peter': 60,
        '2 Peter': 61,
        '1 John': 62,
        '2 John': 63,
        '3 John': 64,
        'Jude': 65,
        'Revelation': 66,
      };

      // Sort the Bible books based on their custom order
      verses.sort((a, b) {
        final int orderA = bookOrder[a['book_name']] ?? 9999;
        final int orderB = bookOrder[b['book_name']] ?? 9999;
        return orderA.compareTo(orderB);
      });

      // Extract unique book names
      final Set<String> uniqueBooks = {};
      for (var verse in verses) {
        uniqueBooks.add(verse['book_name']);
      }

      setState(() {
        bibleBooks = uniqueBooks.toList();
        filteredBooks = bibleBooks;
      });
    });
  }

  Future<String> loadJsonData(String version) async {
    // Load JSON data for the selected version
    String assetPath = 'assets/bibles/kjv.json';
    if (version == 'ASV') {
      assetPath = 'assets/bibles/asv.json';
    } else if (version == 'WEB') {
      assetPath = 'assets/bibles/web.json';
    } else if (version == 'NET') {
      assetPath = 'assets/bibles/net.json';
    }

    return await rootBundle.loadString(assetPath);
  }

  void _navigateToChaptersVerses(BuildContext context, String selectedBook) {
    // Navigate to the chapters/verses screen with the selected book and version
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) =>
                BibleChaptersVersesScreen(selectedBook, selectedVersion),
      ),
    );
  }

  void _filterBooks(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredBooks = bibleBooks;
      });
    } else {
      // Filter the books based on the search query
      final List<String> result =
          bibleBooks
              .where((book) => book.toLowerCase().contains(query.toLowerCase()))
              .toList();
      setState(() {
        filteredBooks = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

class BibleChaptersVersesScreen extends StatelessWidget {
  final String? selectedBook;
  final String selectedVersion;

  const BibleChaptersVersesScreen(
    this.selectedBook,
    this.selectedVersion, {
    super.key,
  });

  Future<String> loadJsonData() async {
    // Load JSON data for the selected version
    String assetPath = 'assets/bibles/kjv.json';
    if (selectedVersion == 'ASV') {
      assetPath = 'assets/bibles/asv.json';
    } else if (selectedVersion == 'WEB') {
      assetPath = 'assets/bibles/web.json';
    } else if (selectedVersion == 'NET') {
      assetPath = 'assets/bibles/net.json';
    }

    return await rootBundle.loadString(assetPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
        title: Text(
          '$selectedVersion - $selectedBook',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        elevation: 0,
      ),
      body: FutureBuilder<String>(
        future: loadJsonData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading indicator
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('No data available.');
          } else {
            final jsonData = json.decode(snapshot.data!);
            final verses = jsonData['verses'];

            // Filter chapters based on the selected book
            final List<int> chapters = [];
            for (var verse in verses) {
              if (verse['book_name'] == selectedBook) {
                final chapter = verse['chapter'];
                if (!chapters.contains(chapter)) {
                  chapters.add(chapter);
                }
              }
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  final chapterNumber = chapters[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      child: ListTile(
                        title: Text('Chapter $chapterNumber'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => BibleVersesScreen(
                                    selectedBook!,
                                    chapterNumber,
                                    verses,
                                  ),
                            ),
                          );
                        },
                        trailing: Icon(
                          Icons.arrow_right_rounded,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class HighlightedVerse {
  final String text;
  final int verseNumber;
  final Color color;

  HighlightedVerse(this.text, this.verseNumber, this.color);
}

class BibleVersesScreen extends StatefulWidget {
  final String selectedBook;
  final int selectedChapter;
  final List<dynamic> verses;

  const BibleVersesScreen(
    this.selectedBook,
    this.selectedChapter,
    this.verses, {
    super.key,
  });

  @override
  State<BibleVersesScreen> createState() => _BibleVersesScreenState();
}
