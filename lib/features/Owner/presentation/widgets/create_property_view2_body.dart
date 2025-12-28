// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:book_it/features/Owner/presentation/widgets/modern_text_field.dart';
import 'package:book_it/features/Owner/presentation/widgets/room_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:book_it/core/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class CreatePropertyView2Body extends StatefulWidget {
  const CreatePropertyView2Body({super.key});

  @override
  State<CreatePropertyView2Body> createState() =>
      _CreatePropertyView2BodyState();
}

class _CreatePropertyView2BodyState extends State<CreatePropertyView2Body> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final areaController = TextEditingController();

  late List<File> images;
  late String category;
  late String governorate;
  late String city;

  int kitchens = 1;
  int bedrooms = 1;
  int bathrooms = 1;

  final _titleKey = GlobalKey();
  final _descriptionKey = GlobalKey();
  final _priceKey = GlobalKey();
  final _areaKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.2,
      );
    }
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      debugPrint("PROPERTY CREATED: ${titleController.text}");
      debugPrint("PROPERTY CREATED: ${descriptionController.text}");
      debugPrint("PROPERTY CREATED: ${priceController.text}");
      debugPrint("PROPERTY CREATED: ${areaController.text}");
      debugPrint("PROPERTY CREATED: $bedrooms");
      debugPrint("PROPERTY CREATED: $bathrooms");
      debugPrint("PROPERTY CREATED: $kitchens");
      debugPrint("PROPERTY CREATED: $category");
      debugPrint("PROPERTY CREATED: $governorate");
      debugPrint("PROPERTY CREATED: $city");
      debugPrint("PROPERTY CREATED: ${images.length}");
    } else {
      if (titleController.text.isEmpty || titleController.text.length > 20) {
        _scrollTo(_titleKey);
      } else if (descriptionController.text.isEmpty) {
        _scrollTo(_descriptionKey);
      } else if (priceController.text.isEmpty) {
        _scrollTo(_priceKey);
      } else {
        _scrollTo(_areaKey);
      }
    }
  }

  @override
  void didChangeDependencies() {
    final data = GoRouterState.of(context).extra as Map<String, dynamic>;

    images = data["images"] as List<File>;
    category = data["category"] as String;
    governorate = data["governorate"] as String;
    city = data["city"] as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as Map<String, dynamic>;

    final List<File> images = data["images"];
    final String category = data["category"];
    final String governorate = data["governorate"];
    final String city = data["city"];

    return Column(
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _header("The Basics", "Keep the title short and catchy"),
                ModernTextField(
                  fieldKey: _titleKey,
                  controller: titleController,
                  hint: "e.g. Fancy Beach House",
                  icon: Icons.title_rounded,
                  maxLength: 20,
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Title is required";
                    if (v.length > 20) return "Maximum 20 characters";
                    return null;
                  },
                ),
                _header("Description", "Describe what guests will love"),
                ModernTextField(
                  fieldKey: _descriptionKey,
                  controller: descriptionController,
                  hint: "Tell us about the view, the neighborhood...",
                  icon: Icons.notes_rounded,
                  maxLines: 4,
                  validator: (v) =>
                      v == null || v.isEmpty ? "Description is required" : null,
                ),
                _header("Numbers", "Set your price and area"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ModernTextField(
                        fieldKey: _priceKey,
                        controller: priceController,
                        hint: "Price",
                        prefix: "\$ ",
                        suffix: "/ night",
                        keyboard: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (v) {
                          if (v == null || v.isEmpty) return "Required";
                          final n = int.tryParse(v);
                          if (n == null || n < 25 || n > 250) {
                            return "\$25 - \$250";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ModernTextField(
                        fieldKey: _areaKey,
                        controller: areaController,
                        hint: "Area",
                        suffix: " m²",
                        keyboard: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (v) {
                          if (v == null || v.isEmpty) return "Required";
                          final n = int.tryParse(v);
                          if (n == null || n < 100 || n > 1000) {
                            return "100-1000 m²";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                _header("Rooms", "How many of each?"),
                RoomSelector(
                  bedrooms: bedrooms,
                  bathrooms: bathrooms,
                  kitchens: kitchens,
                  onBedroomsChanged: (v) => setState(() => bedrooms = v),
                  onBathroomsChanged: (v) => setState(() => bathrooms = v),
                  onKitchensChanged: (v) => setState(() => kitchens = v),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        _buildBottomBar(),
      ],
    );
  }

  // UI COMPONENTS

  Widget _header(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Color(0xFF9E9E9E)),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 34),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 20,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: PrimaryButton(text: "Create Property", onTap: _onSubmit),
      ),
    );
  }
}
