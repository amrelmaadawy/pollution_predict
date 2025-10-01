import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.text,
    required this.labelText,
    required this.validator,
    required this.keyboardType,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String text;
  final String labelText;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          cursorColor: isDark ? kDarkTextGreenColor : klightGreenTextColor,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            labelText: labelText,
            labelStyle: TextStyle(
              color: isDark ? kDarkSubTextColor : kSubTextColor,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? kDarkSubTextColor : kSubTextColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
