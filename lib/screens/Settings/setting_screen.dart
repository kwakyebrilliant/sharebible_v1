import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharebible/theme/theme_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  bool isDarkMode = false;

  String? downloadURL;

  @override
  void initState() {
    super.initState();
    loadSwitchState();
  }

  void loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  void saveSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // Customescrollview for all content
      body: CustomScrollView(
        slivers: [
          // sliverappbar statrts here
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            expandedHeight: 140.0,
            collapsedHeight: 30.0,
            toolbarHeight: 30.0,
            floating: false,
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.person,
                          size: 25.0,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),

                    const SizedBox(width: 5.0),

                    //user first name here
                    Container(
                      color: Theme.of(
                        context,
                      ).colorScheme.surface.withValues(alpha: 0.7),
                      child: Text(
                        'amoah',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              background: Image.asset(
                "assets/images/wall.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // sliverappbar statrts ends

          // SliverToBoxAdapter statrts ends
          // contains all other contents
          SliverToBoxAdapter(
            // Column for all contents
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
