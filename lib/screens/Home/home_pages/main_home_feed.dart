import 'package:comsatsconnect/screens/Home/home_pages/screens_home/event_screen.dart';
import 'package:comsatsconnect/screens/Home/home_pages/screens_home/homefeed.dart';
import 'package:comsatsconnect/screens/Home/home_pages/screens_home/profile_screen.dart';
import 'package:comsatsconnect/screens/Home/home_pages/screens_home/search_screen.dart';
import 'package:comsatsconnect/screens/Home/home_pages/screens_home/shorts_tidbits_screen.dart';
import 'package:comsatsconnect/services/notifications_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainHomeFeed extends StatefulWidget {
  const MainHomeFeed({super.key});

  @override
  _MainHomeFeedState createState() => _MainHomeFeedState();
}

class _MainHomeFeedState extends State<MainHomeFeed> {
  NotificationsServices notificationsServices = NotificationsServices();

  int currentIndex = 0;
  final List<Widget> pages = [
    const HomeFeed(),
    const SearchPage(),
    const ShortsTidbitsScreen(),
    const EventScreen(),
    const ProfilePage(),
  ];

  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: pages,
          onPageChanged: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          currentIndex: currentIndex,
          onTap: onTabTapped,
          unselectedIconTheme: const IconThemeData(
            color: Colors.black87,
            size: 21.0,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 1.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.black,
            size: 24.0,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 2.0,
                offset: Offset(0.2, 0.2),
              ),
            ],
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.slow_motion_video_rounded),
              label: 'Tidbits',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendar),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
