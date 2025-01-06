import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.labelText,
    this.icon,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  final labelText;
  final icon;
  final suffixIcon;
  final obscureText;
  final controller;
  final validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF607D8B), width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF607D8B), width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          fillColor: Theme.of(context).colorScheme.surface,
          labelText: labelText,
          labelStyle: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14.0,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Icon(
              suffixIcon,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          filled: true,
        ),
      ),
    );
  }
}
