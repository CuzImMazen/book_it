import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          // Icon container
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: scheme.primary.withAlpha(30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: scheme.primary.withAlpha(180), size: 20),
          ),

          const SizedBox(width: 16),

          // Title
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          _roundBtn(
            context,
            Icons.remove,
            value > 1 ? () => onChanged(value - 1) : null,
          ),

          SizedBox(
            width: 40,
            child: Center(
              child: Text(
                "$value",
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          _roundBtn(
            context,
            Icons.add,
            value < 10 ? () => onChanged(value + 1) : null,
          ),
        ],
      ),
    );
  }

  Widget _roundBtn(BuildContext context, IconData icon, VoidCallback? action) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: action == null ? scheme.onSurface.withAlpha(20) : scheme.primary,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: action,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            icon,
            size: 18,
            color: action == null
                ? scheme.onSurface.withAlpha(120)
                : scheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
