import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:book_it/features/Book/data/model/confirm_book_data.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:book_it/features/Home/presentation/widgets/book_button.dart';
import 'package:book_it/features/Home/presentation/widgets/detail_page_location_row.dart';
import 'package:book_it/features/Home/presentation/widgets/detail_page_name_row.dart';
import 'package:book_it/features/Home/presentation/widgets/features_scroller.dart';
import 'package:book_it/features/Home/presentation/widgets/property_description.dart';
import 'package:book_it/features/Home/presentation/widgets/property_images_slider.dart';
import 'package:book_it/features/Home/presentation/widgets/property_owner_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailViewBody extends StatelessWidget {
  const DetailViewBody({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PropertyImages(images: property.images ?? []),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DetailPageNameRow(property: property),
                SizedBox(height: 5),
                DetailPageLocationRow(property: property),
                SizedBox(height: 20),
                PropertyFeaturesScroller(property: property),
                SizedBox(height: 20),
                Text(
                  "Property Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 10),

                ReadMoreDescription(property: property),
                SizedBox(height: 20),
                Text(
                  "Owner",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 12),
                OwnerRow(propertyOwner: property.owner!),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    final authState = context.read<AuthenticationCubit>().state;
                    if (authState is AuthenticationSignInSuccess) {
                      if (authState.user.id == property.owner!.id) {
                        showSnackBar(
                          context: context,
                          message: "You can't book your own property",
                          color: Colors.red,
                        );
                        return;
                      }
                      context.push(
                        "/confirm_book",
                        extra: ConfirmBookData(
                          propertyId: property.id,
                          price: property.price,
                        ),
                      );
                    }
                  },
                  child: BookButton(),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
