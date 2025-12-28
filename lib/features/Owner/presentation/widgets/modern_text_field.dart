import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:book_it/core/style/colors.dart';

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
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon != null
              ? Icon(icon, color: kPrimaryColor.withAlpha(150), size: 20)
              : null,
          prefixText: prefix,
          suffixText: suffix,
          suffixStyle: TextStyle(
            color: kPrimaryColor.withAlpha(150),
            fontWeight: FontWeight.bold,
          ),
          hintStyle: const TextStyle(
            color: Color(0xFFBDBDBD),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.white,
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
            borderSide: const BorderSide(color: Color(0xFFF5F5F5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: kPrimaryColor.withAlpha(150),
              width: 1.5,
            ),
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
