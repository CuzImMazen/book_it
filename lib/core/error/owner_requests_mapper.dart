import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

String mapOwnerRequestMessage(BuildContext context, String rawMessage) {
  switch (rawMessage) {
    case "Booking cant be Accepted due to date conflict":
      return context.ownerloc.ownerRequests_error_booking_conflict;
    case "Modification cant be Accepted due to date conflict":
      return context.ownerloc.ownerRequests_error_modification_conflict;
    case "Booking request accepted successfully":
      return context.ownerloc.ownerRequests_accept_success;
    case "Booking request rejected successfully":
      return context.ownerloc.ownerRequests_reject_success;
    case "Modification request accepted successfully":
      return context.ownerloc.ownerRequests_modification_accept_success;
    case "Modification request rejected successfully":
      return context.ownerloc.ownerRequests_modification_reject_success;
    case "Connection timeout. Please try again.":
      return context.ownerloc.ownerRequests_connection_timeout;

    default:
      return context.ownerloc.ownerRequests_unexpected_error;
  }
}
