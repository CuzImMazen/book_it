import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class RoleSelector extends StatefulWidget {
  const RoleSelector({super.key, required this.setRole});

  final void Function(String roleValue) setRole;

  @override
  State<RoleSelector> createState() => _RoleSelectorState();
}

class _RoleSelectorState extends State<RoleSelector> {
  String role = "renter";

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: [
        ButtonSegment(
          value: "owner",
          label: Text(context.auth.auth_owner),
          icon: Icon(Icons.home_outlined),
        ),
        ButtonSegment(
          value: "renter",
          label: Text(context.auth.auth_renter),
          icon: Icon(Icons.person_outline),
        ),
      ],
      selected: <String>{role},
      onSelectionChanged: (newSelection) {
        widget.setRole(newSelection.first);
        setState(() {
          role = newSelection.first;
        });
      },
    );
  }
}
