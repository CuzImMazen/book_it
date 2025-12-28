import 'dart:io';
import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/core/widgets/primary_button.dart';
import 'package:book_it/features/Owner/presentation/widgets/category_selector_chips.dart';
import 'package:book_it/features/Owner/presentation/widgets/image_picker_grid.dart';
import 'package:book_it/features/Owner/presentation/widgets/location_selector.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatePropertyViewBody extends StatefulWidget {
  const CreatePropertyViewBody({super.key});

  @override
  State<CreatePropertyViewBody> createState() => _CreatePropertyViewBodyState();
}

class _CreatePropertyViewBodyState extends State<CreatePropertyViewBody> {
  List<File> propertyImages = [];
  int? mainImageIndex;

  String? selectedCategory;
  String? selectedGovernorate;
  String? selectedCity;

  bool get isFormValid =>
      propertyImages.length >= 3 &&
      selectedCategory != null &&
      selectedGovernorate != null &&
      selectedCity != null;

  List<File> _imagesWithMainFirst() {
    if (mainImageIndex == null || mainImageIndex == 0) {
      return List<File>.from(propertyImages);
    }

    final images = List<File>.from(propertyImages);
    final mainImage = images.removeAt(mainImageIndex!);
    images.insert(0, mainImage);

    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upload Property Images:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15),
            ImagePickerGrid(
              images: propertyImages,
              mainImageIndex: mainImageIndex,
              onPickImages: (files, mainIndex) {
                setState(() {
                  propertyImages = files;
                  mainImageIndex = mainIndex;
                });
              },
            ),
            const SizedBox(height: 20),
            CategorySelectorChips(
              categories: ["House", "Apartment", "Villa"],
              selectedCategory: selectedCategory,
              onCategorySelected: (cat) =>
                  setState(() => selectedCategory = cat),
            ),
            const SizedBox(height: 20),
            LocationSelector(
              selectedGovernorate: selectedGovernorate,
              selectedCity: selectedCity,
              onGovernorateChanged: (gov) => setState(() {
                selectedGovernorate = gov;
                selectedCity = null;
              }),
              onCityChanged: (city) => setState(() => selectedCity = city),
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              text: "Continue",
              onTap: () {
                if (!isFormValid) {
                  if (propertyImages.length < 3) {
                    showSnackBar(
                      context: context,
                      message: "Please upload at least 3 images",
                      color: kPrimaryColor.withAlpha(200),
                    );
                    return;
                  }
                  if (selectedCategory == null) {
                    showSnackBar(
                      context: context,
                      message: "Please select a category",
                      color: kPrimaryColor.withAlpha(200),
                    );
                    return;
                  }
                  if (selectedGovernorate == null) {
                    showSnackBar(
                      context: context,
                      message: "Please select a governorate",
                      color: kPrimaryColor.withAlpha(200),
                    );
                    return;
                  }
                  if (selectedCity == null) {
                    showSnackBar(
                      context: context,
                      message: "Please select a city",
                      color: kPrimaryColor.withAlpha(200),
                    );
                    return;
                  }
                }

                context.push(
                  "/createproperty2",
                  extra: {
                    "images": _imagesWithMainFirst(),
                    "category": selectedCategory,
                    "governorate": selectedGovernorate,
                    "city": selectedCity,
                  },
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
