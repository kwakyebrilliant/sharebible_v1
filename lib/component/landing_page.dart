import 'package:flutter/material.dart';
import 'package:sharebible/screens/Bible/bible_screen.dart';
import 'package:sharebible/screens/Home/home_screen.dart';
import 'package:sharebible/screens/Notification/notification_screen.dart';
import 'package:sharebible/screens/Settings/setting_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const BibleScreen(),
    const NotificationScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:
                      _currentIndex == 0
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow:
                      _currentIndex == 0
                          ? [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.2),
                              blurRadius: 8,
                            ),
                          ]
                          : null,
                ),
                child: const Icon(Icons.home_rounded),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:
                      _currentIndex == 1
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow:
                      _currentIndex == 1
                          ? [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.2),
                              blurRadius: 8,
                            ),
                          ]
                          : null,
                ),
                child: const Icon(Icons.menu_book_rounded),
              ),
              label: 'Bible',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:
                      _currentIndex == 2
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow:
                      _currentIndex == 2
                          ? [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.2),
                              blurRadius: 8,
                            ),
                          ]
                          : null,
                ),
                child: const Icon(Icons.notifications_rounded),
              ),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:
                      _currentIndex == 3
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow:
                      _currentIndex == 3
                          ? [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.2),
                              blurRadius: 8,
                            ),
                          ]
                          : null,
                ),
                child: const Icon(Icons.settings),
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
