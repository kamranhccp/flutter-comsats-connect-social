import 'package:comsatsconnect/screens/Home/settings/settings_screens/verification_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          // ListTile with different categories
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: const Icon(Icons.person, size: 32, color: Colors.white),
            ),
            title: const Text('Account',
                style: TextStyle(fontWeight: FontWeight.w700)),
            subtitle: const Text('Privacy, security, change number'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: const Icon(Icons.chat, size: 32, color: Colors.white),
            ),
            title: const Text('Chats',
                style: TextStyle(fontWeight: FontWeight.w700)),
            subtitle: const Text('Theme, wallpapers, chat history'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          // Verification ListTile
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.yellow.shade700,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: const Icon(Icons.verified_sharp,
                  size: 32, color: Colors.white),
            ),
            title: const Text('Verification',
                style: TextStyle(fontWeight: FontWeight.w700)),
            subtitle: const Text('CC Verified Badge'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Verification screen
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Verification();
              }));
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: const Icon(Icons.notifications,
                  size: 32, color: Colors.white),
            ),
            title: const Text('Notifications',
                style: TextStyle(fontWeight: FontWeight.w700)),
            subtitle: const Text('Message, group & call tones'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: const Icon(Icons.data_saver_off,
                  size: 32, color: Colors.white),
            ),
            title: const Text('Data and storage usage',
                style: TextStyle(fontWeight: FontWeight.w700)),
            subtitle: const Text('Network usage, auto-download'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: const Icon(Icons.help, size: 32, color: Colors.white),
            ),
            title: const Text('Help',
                style: TextStyle(fontWeight: FontWeight.w700)),
            subtitle: const Text('FAQ, contact us, privacy policy'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),

          // All rights reserved in bottom
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '© 2021 Comsats Connect',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
