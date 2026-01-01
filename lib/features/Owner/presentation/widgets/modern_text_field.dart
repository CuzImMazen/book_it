import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ModernTextField extends StatelessWidget {
  const ModernTextField({
    super.key,
    required this.fieldKey,
    required this.controller,
    required this.hint,
    this.icon,
    this.maxLines = 1,
    this.maxLength,
    this.prefix,
    this.suffix,
    this.keyboard = TextInputType.text,
    this.inputFormatters,
    this.validator,
  });

  final GlobalKey fieldKey;
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final int maxLines;
  final int? maxLength;
  final String? prefix;
  final String? suffix;
  final TextInputType keyboard;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      key: fieldKey,
      margin: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboard,
        validator: validator,
        inputFormatters: inputFormatters,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hint,

          prefixIcon: icon != null
              ? Icon(icon, color: scheme.primary.withAlpha(160), size: 20)
              : null,
          // prefixText: prefix,
          // suffixText: suffix,
          // suffixStyle: TextStyle(
          //   color: scheme.primary.withAlpha(160),
          //   fontWeight: FontWeight.bold,
          // ),
          suffix: suffix != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    suffix!,
                    style: TextStyle(
                      color: scheme.primary.withAlpha(160),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                )
              : null,

          hintStyle: theme.textTheme.bodySmall?.copyWith(
            color: scheme.onSurface.withAlpha(120),
          ),

          filled: true,
          fillColor: scheme.surface,

          counterText: "",
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),

          errorStyle: const TextStyle(
            color: Colors.redAccent,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: scheme.onSurface.withAlpha(40)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: scheme.primary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1),
          ),
        ),
      ),
    );
  }
}
