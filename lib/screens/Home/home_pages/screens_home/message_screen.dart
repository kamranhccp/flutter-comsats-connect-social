import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/200'),
              radius: 20, // Adjust the size as needed
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@abeerhaidri',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 24,
            ), // Add icon for more options
            onPressed: () {
              // Handle more options button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 15, // Number of messages
              itemBuilder: (context, index) {
                return MessageBubble(
                  text: 'This is message number $index',
                  isMe: index % 2 == 0, // Alternating messages for demo
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              50,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              50,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: 'Start your conversation...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(FeatherIcons.paperclip),
                    onPressed: () {
                      // options for attachments
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const OptionAttachments();
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      FeatherIcons.send,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // Handle send message button press
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionAttachments extends StatelessWidget {
  const OptionAttachments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      // attachment options go here
      child: Column(
        children: [
          ListTile(
            leading: const Icon(FontAwesomeIcons.file),
            title: const Text('Document'),
            onTap: () {
              // Handle document attachment
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.camera),
            title: const Text('Camera'),
            onTap: () {
              // Handle camera attachment
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.images),
            title: const Text('Videos & Photos'),
            onTap: () {
              // Handle gallery attachment
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.microphone),
            title: const Text('Sounds'),
            onTap: () {
              // Handle audio attachment
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.faceSmile),
            title: const Text('Quick Replies'),
            onTap: () {
              // Handle quick replies attachment
            },
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const MessageBubble({
    required this.text,
    required this.isMe,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isMe ? Colors.white : Colors.black,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: isMe ? FontWeight.w400 : FontWeight.w500,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
