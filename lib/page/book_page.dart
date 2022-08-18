import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookPage extends StatefulWidget {
  BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final nameTextController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  final descriptionController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void selectImages() async {
    final List<XFile>? selectImages = await imagePicker.pickMultiImage();
    if (selectImages!.isNotEmpty) {
      imageFileList!.addAll(selectImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            const Text(
              'Book your',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Kalakal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            KeyboardDismisser(
              gestures: const [GestureType.onTap],
              child: Center(
                child: Column(
                  children: [
                    buildTextName(),
                    const SizedBox(
                      height: 5,
                    ),
                    buildTextAddress(),
                    const SizedBox(
                      height: 5,
                    ),
                    buildTextContact(),
                    const SizedBox(
                      height: 5,
                    ),
                    buildDescription(),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Upload Photo',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 35,
                  width: 125,
                  child: ElevatedButton(
                    child: const Text('Select Images'),
                    onPressed: () {
                      selectImages();
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: 125,
                  child: ElevatedButton(
                    child: const Text('Camera'),
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            GridView.builder(
              itemCount: imageFileList!.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return Image.file(
                  File(imageFileList![index].path),
                  fit: BoxFit.cover,
                );
              },
            ),
            Align(
              alignment: Alignment.center,
              child: image != null
                  ? Image.file(
                      image!,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    )
                  : const Text('No image selected'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextName() => TextField(
        controller: nameTextController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
          labelText: 'Name',
          hintText: 'Juan Pedro',
          prefixIcon: const Icon(Icons.person),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => nameTextController.clear(),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        keyboardType: TextInputType.name,
      );

  Widget buildTextAddress() => TextField(
        controller: addressController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
          labelText: 'Address',
          prefixIcon: const Icon(Icons.house),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => addressController.clear(),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
      );
  Widget buildTextContact() => TextField(
        controller: contactController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
          labelText: 'Contact Number',
          hintText: '0912-345-6789',
          prefixIcon: const Icon(Icons.contact_phone),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => contactController.clear(),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        keyboardType: TextInputType.phone,
      );
  Widget buildDescription() => TextField(
        controller: descriptionController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
          labelText: 'Description',
          prefixIcon: const Icon(Icons.description),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => descriptionController.clear(),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
      );
}
