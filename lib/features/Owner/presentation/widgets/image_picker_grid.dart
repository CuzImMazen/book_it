import 'dart:io';
import 'package:book_it/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerGrid extends StatefulWidget {
  final List<File> images;
  final int? mainImageIndex;
  final Function(List<File>, int?) onPickImages;

  const ImagePickerGrid({
    super.key,
    required this.images,
    this.mainImageIndex,
    required this.onPickImages,
  });

  @override
  State<ImagePickerGrid> createState() => _ImagePickerGridState();
}

class _ImagePickerGridState extends State<ImagePickerGrid> {
  final ImagePicker _picker = ImagePicker();
  late List<File> images;
  int? mainIndex;
  bool _isPicking = false;

  @override
  void initState() {
    super.initState();
    images = widget.images;
    mainIndex = widget.mainImageIndex;
  }

  Future<void> pickImages() async {
    if (_isPicking) return;
    _isPicking = true;

    try {
      final pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        setState(() {
          int availableSlots = 9 - images.length;
          images.addAll(
            pickedFiles.take(availableSlots).map((x) => File(x.path)),
          );
          if (mainIndex == null && images.isNotEmpty) {
            mainIndex = 0;
          }
        });
        widget.onPickImages(images, mainIndex);
      }
    } finally {
      _isPicking = false;
    }
  }

  Future<void> replaceImage(int index) async {
    if (_isPicking) return;
    _isPicking = true;

    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          images[index] = File(pickedFile.path);
        });
        widget.onPickImages(images, mainIndex);
      }
    } finally {
      _isPicking = false;
    }
  }

  void deleteImage(int index) {
    if (_isPicking) return;

    setState(() {
      images.removeAt(index);
      if (mainIndex != null) {
        if (mainIndex == index) {
          mainIndex = null;
        } else if (mainIndex! > index) {
          mainIndex = mainIndex! - 1;
        }
      }
    });

    widget.onPickImages(images, mainIndex);
  }

  void setMainImage(int index) {
    if (_isPicking) return;

    setState(() {
      mainIndex = index;
    });

    widget.onPickImages(images, mainIndex);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: images.length < 9 ? images.length + 1 : images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if (index == images.length && images.length < 9) {
          return GestureDetector(
            onTap: pickImages,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.add_a_photo,
                size: 40,
                color: Colors.grey,
              ),
            ),
          );
        }

        bool isMain = mainIndex == index;
        return Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () => replaceImage(index),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: isMain
                      ? Border.all(color: Colors.blueAccent, width: 3)
                      : null,
                  image: DecorationImage(
                    image: FileImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: GestureDetector(
                onTap: () => deleteImage(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                ),
              ),
            ),
            Positioned(
              bottom: 6,
              left: 6,
              child: GestureDetector(
                onTap: () => setMainImage(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: isMain
                        ? kPrimaryColor.withAlpha(150)
                        : Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    isMain ? "MAIN" : "Set Main",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
