import 'package:flutter/material.dart';
import 'package:book_it/core/style/colors.dart';

class StepperTile extends StatelessWidget {
  const StepperTile({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final IconData icon;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kPrimaryColor.withAlpha(30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: kPrimaryColor.withAlpha(150), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
          _roundBtn(
            Icons.remove,
            value > 1 ? () => onChanged(value - 1) : null,
          ),
          SizedBox(
            width: 40,
            child: Center(
              child: Text(
                "$value",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          _roundBtn(Icons.add, value < 10 ? () => onChanged(value + 1) : null),
        ],
      ),
    );
  }

  Widget _roundBtn(IconData icon, VoidCallback? action) {
    return Material(
      color: action == null
          ? const Color(0xFFF5F5F5)
          : kPrimaryColor.withAlpha(150),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: action,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            icon,
            size: 18,
            color: action == null ? const Color(0xFFBDBDBD) : Colors.white,
          ),
        ),
      ),
    );
  }
}
