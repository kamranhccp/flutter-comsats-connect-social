import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // pickedImage file for further logic.
    }
  }

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
        title: Text(
          'Add Post',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        actions: [
          // Button to post
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text(
              'Post',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add image section
            GestureDetector(
              // Call the image picker function
              onTap: _pickImage,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 230,
                color: Colors.grey,
                child: Icon(
                  Icons.add_a_photo,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),

            // Add caption section
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                maxLines: 5,
                maxLength: 280,
                minLines: 1,
                style: TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 1.3,
                    ),
                  ),
                  hintText: 'Write a caption...',
                ),
              ),
            ),
            // Add location section
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 1.3,
                    ),
                  ),
                  hintText: 'Add a location...',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
