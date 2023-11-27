import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsatsconnect/screens/Home/settings/setting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../registration/sign_in.dart';
import '../edit_profilescreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.grey.shade300,
                      ),
                      // for posts
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 20,
                                width: 50,
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 20,
                                width: 50,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 20,
                                width: 50,
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 20,
                                width: 50,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 20,
                                width: 50,
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 20,
                                width: 50,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Text('User not found in Firestore');
            }

            final userData = snapshot.data!.data() as Map<String, dynamic>;
            final username = userData['username'];
            final name = userData['name'];
            final bio = userData['bio'];
            final isVerified = userData['isVerified'];
            final isFounder = userData['isFounder'];
            final followers = userData['followers'];
            final followings = userData['followings'];
            final posts = userData['posts'];

            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Row(
                        children: [
                          const Icon(
                            FeatherIcons.user,
                            size: 28,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              '@$username',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SettingScreen();
                                },
                              ));
                            },
                            icon: const Icon(
                              FeatherIcons.settings,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const SignOutOption();
                                  });
                            },
                            icon: const Icon(
                              FeatherIcons.logOut,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/id/237/200/200',
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '@$username',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              isVerified ? Icons.verified : Icons.person,
                              color: Colors.black,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            // founder badge
                            Icon(
                              isFounder
                                  ? FeatherIcons.star
                                  : Icons.do_not_disturb,
                              color: Colors.black,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          bio,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                followers.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                followings.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          // no of posts
                          Column(
                            children: [
                              Text(
                                posts.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Posts',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                          ),
                          Icon(
                            FontAwesomeIcons.youtube,
                            color: Colors.red,
                          ),
                          Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.blue,
                          ),
                          Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.red,
                          ),
                          Icon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.blue,
                          ),
                          Icon(
                            FontAwesomeIcons.github,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 45),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const EditProfilePage();
                                },
                              ));
                            },
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(150, 45),
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Share Profile',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Divider(
                        color: Colors.black54,
                        thickness: 1,
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            FeatherIcons.grid,
                            size: 25,
                            color: Colors.black,
                          ),
                          Icon(
                            FeatherIcons.user,
                            size: 25,
                            color: Colors.black54,
                          ),
                          Icon(
                            FeatherIcons.tag,
                            size: 25,
                            color: Colors.black54,
                          ),
                          Icon(
                            FeatherIcons.bookmark,
                            size: 25,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        color: Colors.grey.shade300,
                        child: Image.network(
                          'https://picsum.photos/id/$index/200/200',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    childCount: 12,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SignOutOption extends StatefulWidget {
  const SignOutOption({super.key});

  @override
  State<SignOutOption> createState() => _SignOutOptionState();
}

class _SignOutOptionState extends State<SignOutOption> {
  // Logout function and return to login screen
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SignIn();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Logout',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: const Text(
        'Are you sure you want to logout?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            _signOut();
          },
          child: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
