import 'package:flutter/material.dart';

class LTextFormField extends StatelessWidget {
  const LTextFormField({
    super.key,
    required this.nameController,
    required this.labelText,
    this.obscureText = false,
    this.prefixIcon,
    this.sufixIcon,
    this.validator,
  });

  final TextEditingController nameController;
  final String labelText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFF9747FF);
    const labelTextColor = Color(0xFF000000);
    const borderRadius = BorderRadius.all(
      Radius.circular(15),
    );
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: nameController,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 15,
            color: labelTextColor.withOpacity(0.3),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
            borderRadius: borderRadius,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
            borderRadius: borderRadius,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
            borderRadius: borderRadius,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
            borderRadius: borderRadius,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
            borderRadius: borderRadius,
          ),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
