import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:video_player/video_player.dart';

class ShortsTidbitsScreen extends StatefulWidget {
  const ShortsTidbitsScreen({Key? key}) : super(key: key);

  @override
  State<ShortsTidbitsScreen> createState() => _ShortsTidbitsScreenState();
}

class _ShortsTidbitsScreenState extends State<ShortsTidbitsScreen> {
  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    // Add more video URLs here
  ];

  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: videoUrls.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return ReelsItem(
            videoUrl: videoUrls[index],
            likes: 100,
            comments: 20,
            shares: 10,
            views: 1000,
            username: '@mtalha.07',
            userImageUrl: 'https://picsum.photos/200',
          );
        },
      ),
    );
  }
}

class ReelsItem extends StatelessWidget {
  final String videoUrl;
  final int likes;
  final int comments;
  final int shares;
  final int views;
  final String username;
  final String userImageUrl;

  const ReelsItem({
    Key? key,
    required this.videoUrl,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.views,
    required this.username,
    required this.userImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // video player
            AspectRatio(
              // full screen width and height
              aspectRatio: 0.54,
              child: VideoPlayerWidget(
                videoUrl: videoUrl,
              ),
            ),
            // Tidbit title
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              color: Colors.transparent,
              child: const Text(
                'Tidbits',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            // like, comment, share, and save buttons at the bottom right in a column
            Positioned(
              bottom: 30,
              right: 10,
              child: Column(
                children: [
                  // like button
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // comment button
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.comment,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // share button
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // save button
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      FeatherIcons.save,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            // username and user image and a small follow button at the bottom right
            Positioned(
              bottom: 20,
              left: 10,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(userImageUrl),
                    radius: 22, // Adjust the size as needed
                  ),
                  const SizedBox(width: 10),
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // button for follow
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Follow',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoController;
  final double _volume = 1.0;

  @override
  void initState() {
    super.initState();

    // Initialize the video controller with the provided video URL
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((_) {
            setState(() {
              // Play and pause video on tap
              _videoController.setLooping(true);
              _videoController.play();
            });
          });

    // Set the initial volume level
    _videoController.setVolume(_volume);

    // Handle screen tap to toggle play/pause
    _videoController.addListener(() {
      final isPlaying = _videoController.value.isPlaying;
      if (isPlaying) {
        _videoController.pause();
      } else {
        _videoController.play();
      }
    });
  }

  @override
  void dispose() {
    // Ensure the video controller is disposed to free up resources
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_videoController.value.isInitialized) {
      return GestureDetector(
        onTap: () {
          // On tap, play/pause the video
          final isPlaying = _videoController.value.isPlaying;
          if (isPlaying) {
            _videoController.pause();
          } else {
            _videoController.play();
          }
        },
        child: AspectRatio(
          aspectRatio: _videoController.value.aspectRatio,
          child: VideoPlayer(_videoController),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
          backgroundColor: Colors.white,
        ), // Placeholder for a loading indicator
      );
    }
  }
}
