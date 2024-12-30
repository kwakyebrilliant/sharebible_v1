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
              children: [
                // Padding around search
                Padding(
                  padding: const EdgeInsets.all(15.0),

                  // Container wrapping search
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width - 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.inversePrimary.withValues(alpha: 0.1),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),

                    // Search textfield here
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Search',
                        contentPadding: const EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        fillColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.search_rounded,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          maxHeight: 20.0,
                          maxWidth: 40.0,
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ),

                //Account here
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          width: 1.0,
                        ),
                      ),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 10.0,
                                  ),
                                  child: Container(
                                    height: 35.0,
                                    width: 35.0,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Account',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_right_rounded,
                              size: 50.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //Share, About, FAQ and Help here
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Column(
                      children: [
                        //Share here
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 10.0,
                                        ),
                                        child: Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: BoxDecoration(
                                            color: Colors.cyan,
                                            borderRadius: BorderRadius.circular(
                                              7.0,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.share_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Share ShareBible',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_right_rounded,
                                    size: 50.0,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.inversePrimary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //About here
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 10.0,
                                        ),
                                        child: Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.circular(
                                              7.0,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.info_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'About',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_right_rounded,
                                    size: 50.0,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.inversePrimary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // FAQs here
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 10.0,
                                        ),
                                        child: Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius: BorderRadius.circular(
                                              7.0,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.question_answer_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'FAQs',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_right_rounded,
                                    size: 50.0,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.inversePrimary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //Help here
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 10.0,
                                        ),
                                        child: Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(
                                              7.0,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.help_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Help',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_right_rounded,
                                    size: 50.0,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.inversePrimary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Theme and logout padding here
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),

                  // Container for Theme and logout
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Column(
                      children: [
                        //Theme container here
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 10.0,
                                        ),
                                        child: Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(
                                              7.0,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.dark_mode_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Theme',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Switch(
                                    value: isDarkMode,
                                    onChanged: (value) {
                                      setState(() {
                                        isDarkMode = value;
                                        saveSwitchState();
                                        themeNotifier.toggleTheme();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Padding around logout here
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 10.0,
                                        ),

                                        // Containefr for logout icon
                                        child: Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(
                                              7.0,
                                            ),
                                          ),

                                          // Logout icon
                                          child: const Icon(
                                            Icons.logout_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),

                                      // Logout text
                                      const Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
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
