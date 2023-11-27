import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../widegts/home_postmenu_dots.dart';

class ShowPostMenu extends StatelessWidget {
  const ShowPostMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Divider(),
          SavePostButton(
            onPressed: () {
              // Handle save post button click
            },
            icon: FontAwesomeIcons.solidBookmark,
            titlePostMenu: 'Save Post',
            text: 'Save this post',
          ),
          SavePostButton(
            onPressed: () {
              // Handle report post button click
            },
            icon: FontAwesomeIcons.solidFlag,
            titlePostMenu: 'Report Post',
            text: 'Report this post',
          ),
          SavePostButton(
            onPressed: () {
              // Handle hide post button click
            },
            icon: FontAwesomeIcons.solidShareFromSquare,
            titlePostMenu: 'Share Post',
            text: 'Share this post',
          ),
          // hide
          SavePostButton(
            onPressed: () {
              // Handle hide post button click
            },
            icon: FontAwesomeIcons.solidEyeSlash,
            titlePostMenu: 'Hide Post',
            text: 'Hide this post',
          ),
          // manage suggestions
          SavePostButton(
            onPressed: () {
              // Handle manage suggestions button click
            },
            icon: FontAwesomeIcons.solidUser,
            titlePostMenu: 'Suggestions',
            text: 'Manage suggestions',
          ),
        ],
      ),
    );
  }
}
