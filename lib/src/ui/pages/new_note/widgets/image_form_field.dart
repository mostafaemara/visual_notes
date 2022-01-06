import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageFormField extends StatelessWidget {
  ImageFormField({Key? key, this.selectedImage, required this.onChanged})
      : super(key: key);
  final ImagePicker _picker = ImagePicker();
  final File? selectedImage;
  final void Function(File?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: selectedImage == null
              ? Container(
                  child: Icon(
                    Icons.image,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                )
              : Image.file(
                  selectedImage!,
                  fit: BoxFit.cover,
                ),
          height: 100,
          width: 100,
        ),
        ElevatedButton.icon(
            onPressed: _handlePickImage,
            icon: const Icon(Icons.camera_alt),
            label: const Text("Capture"))
      ],
    );
  }

  void _handlePickImage() async {
    final image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final _selectedImage = File(image.path);
      onChanged(_selectedImage);
    }
  }
}
