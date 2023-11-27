import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  final String postImageUrl;
  final String userImageUrl;
  final String username;
  final String description;

  const PostDetailPage({
    super.key,
    required this.postImageUrl,
    required this.userImageUrl,
    required this.username,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Post Image
            Image.network(
              postImageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // User Info
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(userImageUrl),
              ),
              title: Text(username),
              subtitle: Text(description),
            ),
            // Interaction Buttons (Like, Comment, Dislike)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () {
                    // Handle like button press
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.mode_comment),
                  onPressed: () {
                    // Navigate to the comments section
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.thumb_down),
                  onPressed: () {
                    // Handle dislike button press
                  },
                ),
              ],
            ),
            // Comments Section
            // You can add a widget for displaying comments here
          ],
        ),
      ),
    );
  }
}
