import 'package:book_it/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    required this.validator,
    required this.controller,
    this.isPhone = false,
    this.readOnly = false,
    this.onTap,
  });

  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPhone;
  final bool readOnly;
  final void Function()? onTap;
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = true;

  final Color _focusedColor = kPrimaryColor.withAlpha(150);
  final Color _unfocusedColor = Colors.grey;

  bool get _isFocused => _focusNode.hasFocus;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleObscure() {
    setState(() => _obscureText = !_obscureText);
  }

  OutlineInputBorder get _enabledBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(color: _unfocusedColor, width: 2),
  );

  OutlineInputBorder get _focusedBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(color: _focusedColor, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    final iconColor = _isFocused ? _focusedColor : _unfocusedColor;
    final fillColor = _isFocused ? _focusedColor : _unfocusedColor;
    return TextFormField(
      controller: widget.controller,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      keyboardType: widget.isPhone ? TextInputType.phone : null,
      inputFormatters: widget.isPhone
          ? [FilteringTextInputFormatter.digitsOnly]
          : [],
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscureText : false,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: (fillColor).withAlpha(20),
        prefixIcon: Icon(widget.prefixIcon, color: iconColor),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: iconColor,
                ),
                onPressed: _toggleObscure,
              )
            : null,

        // Borders
        enabledBorder: _enabledBorder,
        focusedBorder: _focusedBorder,
        errorBorder: _enabledBorder,
        focusedErrorBorder: _focusedBorder,
      ),
    );
  }
}
