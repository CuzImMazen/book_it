import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

String localizedCategory(BuildContext context, String catgeory) {
  switch (catgeory.toLowerCase()) {
    case "villa":
      return context.ownerloc.villa;
    case "house":
      return context.ownerloc.house;
    case "apartment":
      return context.ownerloc.apartment;
    default:
      return catgeory;
  }
}
