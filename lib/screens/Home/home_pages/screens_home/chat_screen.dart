import 'package:comsatsconnect/data/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'message_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.edit,
              size: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // search bar
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 14, right: 14),
            child: Container(
              height: 50,
              color: Colors.grey[200],
              child: const Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
          // list of stories in horizontal scroll
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: friendsList.length,
              itemBuilder: (BuildContext context, int index) {
                final story = friendsList[index];
                final storyName = story['username'];
                final storyImgUrl = story['imgUrl'];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 3,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(storyImgUrl),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(storyName),
                    ],
                  ),
                );
              },
            ),
          ),
          // list of groups
          Expanded(
            child: ListView.builder(
              itemCount: friendsList
                  .length, // Replace with the length of your friendsList
              itemBuilder: (BuildContext context, int index) {
                final friend = friendsList[index];
                final contactName = friend['username'];
                final contactImgUrl = friend['imgUrl'];

                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MessageScreen(),
                      ),
                    );
                  },
                  shape: const Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(contactImgUrl),
                  ),
                  title: Text(contactName),
                  titleTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16,
                    letterSpacing: 0.4,
                  ),
                  subtitle: Text(friend['lastMsg']),
                  trailing: Column(
                    children: [
                      Text(friend['lastMsgTime']),
                      if (friend['hasUnSeenMsgs'])
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.black38,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            friend['unseenCount'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
