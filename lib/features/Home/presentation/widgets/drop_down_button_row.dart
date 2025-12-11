import 'package:flutter/material.dart';

class DropDownButtonRow extends StatelessWidget {
  const DropDownButtonRow({
    super.key,
    required this.items,
    required this.text,
    this.currentValue,
    required this.onChanged,
    required this.hintText,
  });

  final String text;
  final List<String> items;
  final String? currentValue;
  final void Function(String?)? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        DropdownButton<String>(
          menuMaxHeight: 500,
          hint: Center(child: Text(hintText!)),
          value: items.contains(currentValue) ? currentValue : null,

          onChanged: onChanged,
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
        ),
      ],
    );
  }
}
