import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/core/widgets/label_text.dart';
import 'package:book_it/features/Authentication/presentation/widgets/role_selector.dart';
import 'package:flutter/material.dart';

class RoleSelectorRow extends StatelessWidget {
  const RoleSelectorRow({super.key, required this.setRole});
  final void Function(String roleValue) setRole;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LabelText(text: context.auth.auth_chooseRole),
        Spacer(),
        RoleSelector(setRole: setRole),
      ],
    );
  }
}
