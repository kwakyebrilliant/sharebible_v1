import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Dropdown for selecting the Bible version
            DropdownButton<String>(
              value: selectedVersion,
              onChanged: (String? newValue) {
                // Use String? instead of String
                if (newValue != null) {
                  // Check for null
                  setState(() {
                    selectedVersion = newValue;
                  });

                  // Load JSON data for the selected version
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
              },
              dropdownColor: Theme.of(context).colorScheme.secondary,
              items:
                  availableVersions.map((String version) {
                    return DropdownMenuItem<String>(
                      value: version,
                      child: Text(version),
                    );
                  }).toList(),
            ),

            const SizedBox(width: 20.0),

            //search textfield
            Container(
              width: MediaQuery.of(context).size.width - 180.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Find book...',
                  contentPadding: const EdgeInsets.all(10.0),
                  border: InputBorder.none,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Icon(
                      Icons.search_rounded,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 20.0,
                    maxWidth: 40.0,
                  ),
                  prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                onChanged: _filterBooks,
              ),
            ),

            //displays user's profile image
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              child: Icon(
                Icons.person,
                size: 40.0,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: filteredBooks.length,
          itemBuilder: (context, index) {
            final selectedBook = filteredBooks[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                child: ListTile(
                  title: Text(selectedBook),
                  //Navigates to chapter of the selected book
                  onTap: () {
                    _navigateToChaptersVerses(context, selectedBook);
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
      ),
    );
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

class _BibleVersesScreenState extends State<BibleVersesScreen> {
  List<HighlightedVerse> highlightedVerses = [];
  // Declare SharedPreferences instance
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadHighlightedVerses();
  }

  //load highlighted verses for the authenticated user
  void _loadHighlightedVerses() async {
    _prefs = await SharedPreferences.getInstance();
    final highlightedVersesList = _prefs.getStringList('highlightedVerses');
    if (highlightedVersesList != null) {
      highlightedVerses =
          highlightedVersesList.map((verse) {
            final parts = verse.split('|');
            return HighlightedVerse(
              parts[0],
              int.parse(parts[1]),
              Color(int.parse(parts[2])),
            );
          }).toList();
      setState(() {});
    }
  }

  // Save the updated highlighted verses
  void _saveHighlightedVerses() {
    final highlightedVersesList =
        highlightedVerses
            .map(
              (verse) =>
                  '${verse.text}|${verse.verseNumber}|${verse.color.value}',
            )
            .toList();
    _prefs.setStringList('highlightedVerses', highlightedVersesList);
  }

  void toggleHighlight(String text, int verseNumber, Color color) {
    setState(() {
      final highlightedVerse = HighlightedVerse(text, verseNumber, color);
      if (highlightedVerses.contains(highlightedVerse)) {
        highlightedVerses.remove(highlightedVerse);
      } else {
        highlightedVerses.add(highlightedVerse);
      }
      _saveHighlightedVerses();
    });
  }

  //remove highlighted verse
  void removeHighlight(String text, int verseNumber) {
    setState(() {
      highlightedVerses.removeWhere(
        (v) => v.text == text && v.verseNumber == verseNumber,
      );
      _saveHighlightedVerses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final chapterVerses =
        widget.verses
            .where(
              (verse) =>
                  verse['book_name'] == widget.selectedBook &&
                  verse['chapter'] == widget.selectedChapter,
            )
            .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          '${widget.selectedBook} Chapter ${widget.selectedChapter}',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            child: Icon(
              Icons.arrow_left_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 50.0,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: chapterVerses.length,
          itemBuilder: (context, index) {
            final verse = chapterVerses[index];
            final text = verse['text'];
            final verseNumber = verse['verse'];

            // Default color
            Color highlightColor = Colors.transparent;

            for (var highlightedVerse in highlightedVerses) {
              if (highlightedVerse.text == text &&
                  highlightedVerse.verseNumber == verseNumber) {
                highlightColor = highlightedVerse.color;
                break;
              }
            }

            return ListTile(
              title: Text('Verse $verseNumber'),
              subtitle: Text(text),
              tileColor: highlightColor,
              onTap: () {
                _showContextMenu(context, text, verseNumber, highlightColor);
              },
            );
          },
        ),
      ),
    );
  }

  void _showContextMenu(
    BuildContext context,
    String text,
    int verseNumber,
    Color highlightColor,
  ) {
    final isHighlighted = highlightColor != Colors.transparent;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(title: Text("Select Color"), dense: true),
            ListTile(
              title: const Text("Red"),
              leading: const Icon(Icons.format_paint, color: Colors.red),
              onTap: () {
                if (isHighlighted && highlightColor != Colors.red) {
                  removeHighlight(
                    text,
                    verseNumber,
                  ); // Remove existing highlight
                }
                toggleHighlight(
                  text,
                  verseNumber,
                  Colors.red,
                ); // Add or update highlight
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text("Green"),
              leading: const Icon(Icons.format_paint, color: Colors.green),
              onTap: () {
                if (isHighlighted && highlightColor != Colors.green) {
                  removeHighlight(
                    text,
                    verseNumber,
                  ); // Remove existing highlight
                }
                toggleHighlight(
                  text,
                  verseNumber,
                  Colors.green,
                ); // Add or update highlight
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text("Blue"),
              leading: const Icon(Icons.format_paint, color: Colors.blue),
              onTap: () {
                if (isHighlighted && highlightColor != Colors.blue) {
                  removeHighlight(
                    text,
                    verseNumber,
                  ); // Remove existing highlight
                }
                toggleHighlight(
                  text,
                  verseNumber,
                  Colors.blue,
                ); // Add or update highlight
                Navigator.of(context).pop();
              },

              // Add an option to remove the highlight
            ),
            ListTile(
              title: const Text("Remove Highlight"),
              leading: Icon(
                Icons.remove,
                color: isHighlighted ? Colors.red : Colors.grey,
              ),
              onTap: () {
                if (isHighlighted) {
                  removeHighlight(text, verseNumber);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
