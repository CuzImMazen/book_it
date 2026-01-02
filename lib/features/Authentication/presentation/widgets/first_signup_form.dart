import 'dart:developer';
import 'dart:io';

import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/core/utils/validators.dart';
import 'package:book_it/core/widgets/back_button_row.dart';
import 'package:book_it/features/Authentication/data/models/first_signup_data.dart';
import 'package:book_it/core/widgets/primary_button.dart';
import 'package:book_it/core/widgets/custom_text_field.dart';
import 'package:book_it/features/Authentication/presentation/widgets/image_picker_container.dart';
import 'package:book_it/core/widgets/primary_text.dart';
import 'package:book_it/core/widgets/secondary_text.dart';
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
    final selectedDate = await pickBirthDate(context: context);
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
              PrimaryText(text: context.auth.auth_signupTitle),
              const SizedBox(height: 10),
              SecondaryText(text: context.auth.auth_signupSubtitle),
              const SizedBox(height: 40),

              CustomTextField(
                hintText: context.auth.auth_enterFirstName,
                prefixIcon: Icons.person,

                validator: (value) => nameValidator(context, value),
                controller: nameController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: context.auth.auth_enterLastName,
                prefixIcon: Icons.person,

                validator: (value) => nameValidator(context, value),
                controller: lastNameController,
              ),

              const SizedBox(height: 20),
              CustomTextField(
                validator: (value) => dateOfBirthValidator(context, value),
                hintText: context.auth.auth_selectBirthDate,
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
              PrimaryButton(
                text: context.auth.auth_continue,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (profileImage == null) {
                      showSnackBar(
                        context: context,
                        message: context.auth.auth_pleaseUploadProfile,
                        color: kPrimaryColor.withAlpha(200),
                      );

                      return;
                    }

                    if (idImage == null) {
                      showSnackBar(
                        context: context,
                        message: context.auth.auth_pleaseUploadId,
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
