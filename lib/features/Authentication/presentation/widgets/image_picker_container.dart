import 'dart:io';

import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerContainer extends StatefulWidget {
  const ImagePickerContainer({
    super.key,

    required this.setImage,
    this.isProfile = false,
  });

  final void Function({required File? image, bool isProfile}) setImage;
  final bool isProfile;

  @override
  State<ImagePickerContainer> createState() => _ImagePickerContainerState();
}

class _ImagePickerContainerState extends State<ImagePickerContainer> {
  final ImagePicker _picker = ImagePicker();
  File? image;
  String? imageName;
  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (pickedFile != null) {
        widget.setImage(
          image: File(pickedFile.path),
          isProfile: widget.isProfile,
        );
        setState(() {
          image = File(pickedFile.path);
        });
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(
          context: context,
          message: "couldnt upload image",
          color: Colors.red,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final placeholder = widget.isProfile
        ? "Tap to upload your profile image"
        : "Tap to upload your ID image";

    return GestureDetector(
      onTap: pickImage,
      child: Container(
        height: 60,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: image != null
              ? kPrimaryColor.withAlpha(20)
              : Colors.grey.withAlpha(20),
          border: Border.all(
            width: 2,
            color: image != null ? kPrimaryColor.withAlpha(150) : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                image?.path.split("/").last ?? placeholder,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            GestureDetector(
              child: Icon(
                Icons.delete,
                color: image?.path.split("/").last == null
                    ? Colors.grey
                    : kPrimaryColor.withAlpha(150),
              ),
              onTap: () {
                setState(() {
                  image = null;
                });
                widget.setImage(image: null, isProfile: widget.isProfile);
              },
            ),
            SizedBox(width: 10),
            Icon(
              Icons.upload_file,
              color: image?.path.split("/").last == null
                  ? Colors.grey
                  : kPrimaryColor.withAlpha(150),
            ),
          ],
        ),
      ),
    );
  }
}
