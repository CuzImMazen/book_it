import 'dart:io';
import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/core/utils/validators.dart';
import 'package:book_it/core/widgets/primary_button.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/create_property_cubit.dart';
import 'package:book_it/features/Owner/presentation/ViewModel/cubit/owner_properties_cubit.dart';
import 'package:book_it/features/Owner/presentation/widgets/modern_text_field.dart';
import 'package:book_it/features/Owner/presentation/widgets/room_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<CreatePropertyCubit>().createProperty(
        name: titleController.text,
        description: descriptionController.text,
        category: category.toLowerCase(),
        governorate: governorate,
        city: city,
        pricePerDay: int.parse(priceController.text),
        area: int.parse(areaController.text),
        rooms: bedrooms,
        bathrooms: bathrooms,
        kitchens: kitchens,
        images: images,
      );
    }
  }

  @override
  void didChangeDependencies() {
    final data = GoRouterState.of(context).extra as Map<String, dynamic>;
    images = data["images"];
    category = data["category"];
    governorate = data["governorate"];
    city = data["city"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return BlocConsumer<CreatePropertyCubit, CreatePropertyState>(
      listener: (context, state) {
        if (state is CreatePropertyError) {
          showSnackBar(context: context, message: state.message);
        }

        if (state is CreatePropertySuccess) {
          context.read<OwnerPropertiesCubit>().getOwnerProperties();
          context.read<PropertyCubit>().getProperties(const {});
          showSnackBar(
            context: context,
            message: "Property created successfully",
            color: Colors.green,
          );
          // context.go('/main/myproperties');
          context.pop();
          context.pop();
        }
      },
      builder: (context, state) {
        if (state is CreatePropertyLoading) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }

        return Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    _header(
                      theme,
                      "The Basics",
                      "Keep the title short and catchy",
                    ),
                    ModernTextField(
                      fieldKey: _titleKey,
                      controller: titleController,
                      hint: "Fancy Beach House",
                      maxLength: 20,
                      validator: (v) =>
                          v == null || v.isEmpty ? "Title required" : null,
                    ),
                    _header(theme, "Description", "What will guests love?"),
                    ModernTextField(
                      hint: "Tell us about the view, the neighborhood...",
                      fieldKey: _descriptionKey,
                      controller: descriptionController,
                      maxLines: 4,
                      validator: (v) => v == null || v.isEmpty
                          ? "Description required"
                          : null,
                    ),
                    _header(theme, "Numbers", "Price & area"),
                    Row(
                      children: [
                        Expanded(
                          child: ModernTextField(
                            hint: "Price",
                            fieldKey: _priceKey,
                            controller: priceController,
                            keyboard: TextInputType.number,
                            validator: priceValidator,
                            suffix: "\$",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ModernTextField(
                            hint: "Area",
                            fieldKey: _areaKey,
                            controller: areaController,
                            keyboard: TextInputType.number,
                            validator: areaValidator,
                            suffix: "m²",
                          ),
                        ),
                      ],
                    ),
                    _header(theme, "Rooms", "How many?"),
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
            // Bottom bar
            Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              decoration: BoxDecoration(
                color: scheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(40),
                    blurRadius: 24,
                    offset: const Offset(0, -6),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: PrimaryButton(text: "Create Property", onTap: _onSubmit),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _header(ThemeData theme, String title, String subtitle) {
    final scheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: scheme.onSurface.withAlpha(150),
            ),
          ),
        ],
      ),
    );
  }
}
