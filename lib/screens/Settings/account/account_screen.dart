import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebible/utility/buttons/large_button.dart';
import 'package:sharebible/utility/buttons/small_rounded_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final List<String> daysOfWeek = const [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream:
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),

      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.data() == null) {
          return const Center(child: CircularProgressIndicator());
        }
        var userData = snapshot.data?.data() as Map<String, dynamic>;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          // AppBar starts here
          appBar: AppBar(
            backgroundColor: Theme.of(
              context,
            ).colorScheme.secondary.withValues(alpha: 0.4),
            elevation: 0,
            title: Text(
              'Profile',
              style: GoogleFonts.inter(
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

          // Body starts here
          body: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Form(
              child: Stack(
                children: [
                  // Positioned for displaying user profile
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.inversePrimary.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
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
                              size: 150.0,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Positioned for taking picture for user profile
                  Positioned(
                    top: 10.0,
                    left: 0.0,
                    right: 140.0,
                    child: Center(
                      child: SmallRoundedButton(
                        function: () {},
                        icon: Icons.photo_camera_rounded,
                        size: 20.0,
                      ),
                    ),
                  ),

                  // Positioned for uploading picture for user profile
                  Positioned(
                    top: 140.0,
                    left: 160.0,
                    right: 0.0,
                    child: Center(
                      child: SmallRoundedButton(
                        function: () {},
                        icon: Icons.photo,
                        size: 20.0,
                      ),
                    ),
                  ),

                  // Positioned for a part of user's detail
                  Positioned(
                    top: 170.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 1.0, color: Colors.blueGrey),
                      ),

                      // Column for a part of user's details
                      child: Column(
                        children: [
                          // Row for fullname, username and edit icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Column for fullname and username
                              Column(
                                children: [
                                  // Richtext for fullname and username
                                  RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      style: GoogleFonts.inter(height: 1.1),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '${userData['full name']}\n',
                                          style: GoogleFonts.inter(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFF7F7FA),
                                          ),
                                        ),

                                        TextSpan(
                                          text: '@${userData['user name']}\n',
                                          style: GoogleFonts.inter(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFF7F7FA),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              // Container around edit icon
                              Container(
                                height: 42.0,
                                width: 42.0,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withValues(alpha: 0.7),
                                  borderRadius: BorderRadius.circular(100.0),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.blueGrey,
                                  ),
                                ),

                                // Centered edit icon
                                child: Center(
                                  child: Icon(
                                    Icons.edit,
                                    color: Color(0xFFFFFFFF),
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Padding around row for streak
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),

                            // Row for streak
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 40.0,
                                  width: MediaQuery.of(context).size.width - 82,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 7,
                                        ),
                                    itemCount: daysOfWeek.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Text(
                                            daysOfWeek[index],
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFF7F7FA),
                                            ),
                                          ),
                                          const SizedBox(height: 4.0),
                                          Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.surface,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Padding around align
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),

                    // Align here
                    child: Align(
                      alignment: Alignment.bottomCenter,

                      // Button here
                      child: LargeButton(text: 'Save', function: () {}),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
