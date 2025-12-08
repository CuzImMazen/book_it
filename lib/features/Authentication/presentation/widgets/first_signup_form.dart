import 'dart:developer';
import 'dart:io';

import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/core/utils/validators.dart';
import 'package:book_it/core/widgets/back_button_row.dart';
import 'package:book_it/features/Authentication/data/models/first_signup_data.dart';
import 'package:book_it/features/Authentication/presentation/widgets/auth_primary_button.dart';
import 'package:book_it/features/Authentication/presentation/widgets/auth_text_field.dart';
import 'package:book_it/features/Authentication/presentation/widgets/image_picker_container.dart';
import 'package:book_it/features/Authentication/presentation/widgets/primary_auth_text.dart';
import 'package:book_it/features/Authentication/presentation/widgets/secondary_auth_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstSignupForm extends StatefulWidget {
  const FirstSignupForm({super.key});

  @override
  State<FirstSignupForm> createState() => _FirstSignupFormState();
}

class _FirstSignupFormState extends State<FirstSignupForm> {
  File? profileImage;

  File? idImage;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController birthDateController = TextEditingController();

  Future<void> handlePickBirthDate() async {
    final selectedDate = await pickDate(context: context);
    if (selectedDate != null) {
      birthDateController.text = selectedDate;
    }
  }

  Future<void> setImage({File? image, bool isProfile = false}) async {
    if (isProfile) {
      profileImage = image;
    } else {
      idImage = image;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();

    birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              BackButtonRow(),
              const SizedBox(height: 30),
              const PrimaryAuthText(text: "Let's explore together!"),
              const SizedBox(height: 10),
              const SecondaryAuthText(
                text:
                    "Create your account to start listing or renting homes instantly.",
              ),
              const SizedBox(height: 40),

              AuthTextField(
                hintText: "Enter your first name",
                prefixIcon: Icons.person,

                validator: nameValidator,
                controller: nameController,
              ),
              const SizedBox(height: 20),
              AuthTextField(
                hintText: "Enter your last name",
                prefixIcon: Icons.person,

                validator: nameValidator,
                controller: lastNameController,
              ),

              const SizedBox(height: 20),
              AuthTextField(
                validator: dateOfBirthValidator,
                hintText: "Select your birth date",
                prefixIcon: Icons.calendar_today,

                controller: birthDateController,

                readOnly: true,
                onTap: handlePickBirthDate,
              ),
              const SizedBox(height: 20),
              // profile pic upload
              ImagePickerContainer(isProfile: true, setImage: setImage),

              const SizedBox(height: 20),
              // id image upload
              ImagePickerContainer(setImage: setImage),
              SizedBox(height: 40),
              AuthPrimaryButton(
                text: 'Continue',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (profileImage == null) {
                      showSnackBar(
                        context: context,
                        message: "Please upload a profile image",
                        color: kPrimaryColor.withAlpha(200),
                      );

                      return;
                    }

                    if (idImage == null) {
                      showSnackBar(
                        context: context,
                        message: "Please upload an ID image",
                        color: kPrimaryColor.withAlpha(200),
                      );

                      return;
                    }
                    log(profileImage!.path);
                    log(idImage!.path);
                    context.push(
                      "/signup2",
                      extra: FirstSignupData(
                        name: nameController.text.trim(),
                        lastName: lastNameController.text.trim(),
                        birthDate: birthDateController.text.trim(),
                        profileImage: profileImage,
                        idImage: idImage,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
