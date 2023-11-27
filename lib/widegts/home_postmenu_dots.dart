import 'package:flutter/material.dart';

class SavePostButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String? titlePostMenu;
  final String? text;

  const SavePostButton({
    this.onPressed,
    this.icon,
    this.text,
    this.titlePostMenu,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            child: Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              titlePostMenu!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
            ),
            child: Text(
              text!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
