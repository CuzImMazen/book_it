import 'package:book_it/core/style/colors.dart';
import 'package:book_it/features/Home/data/models/property_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMoreDescription extends StatelessWidget {
  const ReadMoreDescription({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ReadMoreText(
        trimLines: 3,
        trimMode: TrimMode.Line,
        moreStyle: TextStyle(
          fontSize: 14,
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
        lessStyle: TextStyle(
          fontSize: 14,
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
        property.description,
        colorClickableText: kPrimaryColor,
      ),
    );
  }
}
