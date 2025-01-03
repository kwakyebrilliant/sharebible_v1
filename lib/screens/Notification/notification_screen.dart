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
          // sliverappbar starts here
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,

            // Title starts here
            title: Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 10.0),

              // Row for circleavatar and settings icon
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CircleAvatar for profile centered
                  Center(
                    // Container for the profile
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.inversePrimary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        // CircleAvatar for the profile
                        child:
                        //displays user's profile image
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueGrey,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 35.0,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // settings icon
                  const Icon(Icons.settings_outlined, size: 18.0),
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              // Notifications text
              title: Text(
                'Notifications',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            floating: true,
            snap: true,
            expandedHeight: 100.0,
            collapsedHeight: 55.0,
            toolbarHeight: 55.0,
            pinned: true,
          ),
          // sliverappbar ends here

          // SliverToBoxAdapter starts here
          // contains all other contents
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Padding around notiification list 1
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          width: 1.0,
                        ),
                      ),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 10.0,
                            bottom: 10.0,
                          ),
                          child: Icon(
                            Icons.menu_book_rounded,
                            color: Colors.pink,
                            size: 28.0,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Exodus 1:12',
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.blueGrey,
                              ),
                            ),
                            const Text(
                              'Account',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '9:12 am',
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
