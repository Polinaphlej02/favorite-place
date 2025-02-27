import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onTakeImage});

  final void Function(File image) onTakeImage; 

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _takenImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _takenImage = File(pickedImage.path);
    });

    widget.onTakeImage(_takenImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      label: const Text("Take picture"),
      icon: const Icon(Icons.camera),
    );

    if (_takenImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _takenImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: Theme.of(context).colorScheme.primary,
      )),
      height: 300,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
