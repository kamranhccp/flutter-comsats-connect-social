import 'package:flutter/material.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';

import '../searchscreen_post_page.dart';

class SearchPage extends StatelessWidget {
  final BuildContext? context;
  const SearchPage({
    Key? key,
    this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Container(
                height: 50,
                color: Colors.grey[200],
                child: const Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.search,
                      size: 21,
                      color: Colors.black,
                    ),
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
          ),
          // Wall Layout for Posts
          Expanded(
            child: WallLayout(
              stones: _buildStonesList(),
              layersCount: 3, // Define the number of layers/columns
              scrollDirection: Axis.vertical, // Choose scroll direction
            ),
          ),
        ],
      ),
    );
  }

  List<Stone> _buildStonesList() {
    return <Stone>[
      Stone(
        id: 1,
        width: 2,
        height: 2,
        child: _buildPost(
          'https://i.imgur.com/56nBPMV.jpeg',
          'https://i.imgur.com/vFCa6t8.jpeg',
          'User1', // Username
          'This is the first post.', // Post Description
        ),
      ),
      Stone(
        id: 2,
        width: 1,
        height: 1,
        child: _buildPost(
          'https://i.imgur.com/lkO0xOf.jpeg',
          'https://i.imgur.com/sJTCB8H.jpeg',
          'User2',
          'This is the second post.',
        ),
      ),
      Stone(
        id: 3,
        width: 1,
        height: 1,
        child: _buildPost(
          'https://i.imgur.com/56nBPMV.jpeg',
          'https://i.imgur.com/vFCa6t8.jpeg',
          'User3',
          'This is the third post.',
        ),
      ),
      Stone(
        id: 4,
        width: 3,
        height: 1,
        child: _buildPost(
          'https://i.imgur.com/KPAr4yG.jpeg',
          'https://i.imgur.com/RvBJHcv.jpeg',
          'User4',
          'This is the fourth post.',
        ),
      ),
      Stone(
        id: 5,
        width: 1,
        height: 1,
        child: _buildPost(
          'https://i.imgur.com/RvBJHcv.jpeg',
          'https://i.imgur.com/KPAr4yG.jpeg',
          'User5',
          'This is the fifth post.',
        ),
      ),
      Stone(
        id: 6,
        width: 3,
        height: 1,
        child: _buildPost(
          'https://i.imgur.com/E9gvRhI.png',
          'https://i.imgur.com/pMmGR3b.jpeg',
          'User6',
          'This is the sixth post.',
        ),
      ),
      Stone(
        id: 7,
        width: 1,
        height: 1,
        child: _buildPost(
          'https://i.imgur.com/pMmGR3b.jpeg',
          'https://i.imgur.com/E9gvRhI.png',
          'User7',
          'This is the seventh post.',
        ),
      ),
      Stone(
        id: 8,
        width: 1,
        height: 1,
        child: _buildPost(
          'https://i.imgur.com/lkO0xOf.jpeg',
          'https://i.imgur.com/sJTCB8H.jpeg',
          'User8',
          'This is the eighth post.',
        ),
      ),
      Stone(
        id: 9,
        width: 1,
        height: 1,
        child: _buildPost(
          'https://i.imgur.com/sJTCB8H.jpeg',
          'https://i.imgur.com/lkO0xOf.jpeg',
          'User9',
          'This is the ninth post.',
        ),
      ),
      Stone(
        id: 10,
        width: 1,
        height: 1,
        child: _buildPost(
          'https://i.imgur.com/vFCa6t8.jpeg',
          'https://i.imgur.com/56nBPMV.jpeg',
          'User10',
          'This is the tenth post.',
        ),
      ),
      Stone(
        id: 11,
        width: 1,
        height: 1,
        child: _buildPost(
          'https://i.imgur.com/KPAr4yG.jpeg',
          'https://i.imgur.com/RvBJHcv.jpeg',
          'User11',
          'This is the eleventh post.',
        ),
      ),
    ];
  }

  // Build the content for each Stone with post details
  Widget _buildPost(
    String postImageUrl,
    String userImageUrl,
    String username,
    String description,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context!).push(MaterialPageRoute(
          builder: (context) => PostDetailPage(
            postImageUrl: postImageUrl,
            userImageUrl: userImageUrl,
            username: username,
            description: description,
          ),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.black45,
              Colors.black12,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(
            color: Colors.black12,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Image.network(
              postImageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(userImageUrl),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  username,
                  style: const TextStyle(
                    backgroundColor: Colors.black12,
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
