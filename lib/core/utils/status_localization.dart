import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

String localizedStatus(BuildContext context, String status) {
  switch (status.toLowerCase()) {
    case "canceled":
      return context.history.status_canceled;
    case "completed":
      return context.history.status_completed;
    case "active":
      return context.history.status_active;
    case "pending":
      return context.history.status_pending;
    case "pendingedit":
      return context.history.status_edit;
    case "upcoming":
      return context.history.status_upcoming;
    default:
      return status;
  }
}
