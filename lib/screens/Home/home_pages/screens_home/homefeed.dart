import 'package:comsatsconnect/screens/Home/home_pages/screens_home/notification_screen.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/chat.dart';
import '../../widgets/show_postmenu.dart';
import '../comment_screen.dart';
import 'addpost_screen.dart';
import 'chat_screen.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  String selectedButton = 'New';

  void setSelectedButton(String button) {
    setState(() {
      selectedButton = button;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: SizedBox(
                height: 72,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile Picture
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1632836924830-4b7b3b5b4b0b?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNnx8fGVufDB8fHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        child: ClipOval(
                          child: Image(
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://i.imgur.com/zL4Krbz.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Name
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 35.0,
                      ),
                      child: Text(
                        "Comsats Connect",
                        style: GoogleFonts.pacifico(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // notification Icon
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 22.0,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationsPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          FontAwesomeIcons.bell,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                    // Chat Icon
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        FontAwesomeIcons.message,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // AppBar End
            // Stories
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Stories",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            // Stories List
            SizedBox(
              height: 170, // Height is double the width
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: friendsList.length, // The number of stories
                itemBuilder: (BuildContext context, int index) {
                  final image = friendsList[index]['imgUrl'];
                  if (index == 0) {
                    // The first item is for adding a new story
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(5), // Rectangle form
                              color: Colors.black,
                              image: const DecorationImage(
                                opacity: 0.65,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://i.imgur.com/zL4Krbz.png',
                                ),
                              ),
                            ),
                            child: Center(
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         const AddPostScreen(),
                                  //   ),
                                  // );

                                  // Option for Story or Post
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            side: const BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                          ),
                                          title: Text(
                                            'Choose an Option',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Add a Story",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      FontAwesomeIcons
                                                          .cameraRetro,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const AddPostScreen(),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      "Add a Post",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const AddPostScreen(),
                                                          ),
                                                        );
                                                      },
                                                      icon: Icon(
                                                        FontAwesomeIcons
                                                            .circlePlus,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Other user stories
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(5), // Rectangle form
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  '$image',
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "User $index",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            // Stories End
            // Posts
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Posts",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          selectedButton == 'New' ? Colors.white : Colors.black,
                      backgroundColor:
                          selectedButton == 'New' ? Colors.black : Colors.white,
                    ),
                    onPressed: () {
                      setSelectedButton('New');
                      // Handle "New" button click
                    },
                    child: const Text("New"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedButton == 'Trending'
                          ? Colors.white
                          : Colors.black,
                      backgroundColor: selectedButton == 'Trending'
                          ? Colors.black
                          : Colors.white,
                    ),
                    onPressed: () {
                      setSelectedButton('Trending');
                      // Handle "Trending" button click
                    },
                    child: const Text("Trending"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedButton == 'Followers'
                          ? Colors.white
                          : Colors.black,
                      backgroundColor: selectedButton == 'Followers'
                          ? Colors.black
                          : Colors.white,
                    ),
                    onPressed: () {
                      setSelectedButton('Followers');
                      // Handle "Followers" button click
                    },
                    child: const Text("Followers"),
                  ),
                ],
              ),
            ),
            // Posts List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10, // The number of posts
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User Information Section (Profile Image and Username)
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20, // Adjust the size as needed
                              backgroundImage: selectedButton == 'New'
                                  ? const NetworkImage(
                                      'https://i.imgur.com/zL4Krbz.png',
                                    )
                                  : selectedButton == 'Trending'
                                      ? const NetworkImage(
                                          'https://i.imgur.com/2l7k1tH.png',
                                        )
                                      : const NetworkImage(
                                          'https://i.imgur.com/2l7k1tH.png',
                                        ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              selectedButton == 'New'
                                  ? '@kamranhccp'
                                  : selectedButton == 'Trending'
                                      ? '@chambermaid'
                                      : '@ahmed',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 8),
                            // verified Icon for founder
                            Icon(
                              (selectedButton == 'New'
                                  ? Icons.verified_rounded
                                  : selectedButton == 'Trending'
                                      ? Icons.verified_rounded
                                      : Icons.verified_rounded),
                              color: selectedButton == 'New'
                                  ? Colors.black
                                  : selectedButton == 'Trending'
                                      ? Colors.blue
                                      : Colors.yellow,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            // Icon for the founder not a verified icon
                            Icon(
                              (selectedButton == 'New'
                                  ? FeatherIcons.star
                                  : selectedButton == 'Trending'
                                      ? null
                                      : null),
                              color: selectedButton == 'New'
                                  ? Colors.black
                                  : selectedButton == 'Trending'
                                      ? null
                                      : null,
                              size: 18,
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {
                                  // show the menu
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => const ShowPostMenu(),
                                  );
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.ellipsis,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Post Image with rounded corners
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image(
                            width: double.infinity,
                            height: 430,
                            fit: BoxFit.cover,
                            image: selectedButton == 'New'
                                ? const NetworkImage(
                                    'https://i.imgur.com/EQJiBy7.jpeg',
                                  )
                                : selectedButton == 'Trending'
                                    ? const NetworkImage(
                                        'https://i.imgur.com/zL4Krbz.png',
                                      )
                                    : const NetworkImage(
                                        'https://i.imgur.com/2l7k1tH.png',
                                      ),
                          ),
                        ),
                        // Post Description
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpandableText(
                            selectedButton == 'New'
                                ? 'This is a new post'
                                : selectedButton == 'Trending'
                                    ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, eget aliquam nisl nisl eget.'
                                    : 'lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, eget aliquam nisl nisl eget. lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, eget aliquam nisl nisl eget. lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, eget aliquam nisl nisl eget.',
                            expandText: 'Read more',
                            collapseText: 'Show less',
                            animation: true,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            animationCurve: Curves.easeInOut,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        // Post Time
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            selectedButton == 'New'
                                ? '1 hour ago'
                                : selectedButton == 'Trending'
                                    ? '2 hours ago'
                                    : '3 hours ago',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),

                        // Vote Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Upvote Button
                            Row(
                              children: [
                                Text(
                                  selectedButton == 'New'
                                      ? '12'
                                      : selectedButton == 'Trending'
                                          ? '2'
                                          : '3',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Handle upvote button click
                                  },
                                  icon: Icon(
                                    selectedButton == 'New'
                                        ? FontAwesomeIcons.circleUp
                                        : selectedButton == 'Trending'
                                            ? FontAwesomeIcons.solidCircleUp
                                            : FontAwesomeIcons.circleUp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            // Down vote Button
                            Row(
                              children: [
                                Text(
                                  selectedButton == 'New'
                                      ? '464'
                                      : selectedButton == 'Trending'
                                          ? '8'
                                          : '37',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Handle down vote button click
                                  },
                                  icon: Icon(
                                    selectedButton == 'New'
                                        ? FontAwesomeIcons.solidCircleDown
                                        : selectedButton == 'Trending'
                                            ? FontAwesomeIcons.circleDown
                                            : FontAwesomeIcons.solidCircleDown,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            // Comment Button
                            Row(
                              children: [
                                Text(
                                  selectedButton == 'New'
                                      ? '871'
                                      : selectedButton == 'Trending'
                                          ? '25'
                                          : '73',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Handle comment button click
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CommentScreen(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.comments,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            // Share Button
                            IconButton(
                              onPressed: () {
                                // Handle share button click
                              },
                              icon: const Icon(
                                FontAwesomeIcons.share,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
