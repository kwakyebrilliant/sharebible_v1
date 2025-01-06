import 'package:flutter/material.dart';

class TextFormField extends StatelessWidget {
  const TextFormField({
    super.key,
    this.labelText,
    this.icon,
    this.obscureText,
    this.suffixIcon,
  });

  final labelText;
  final icon;
  final suffixIcon;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextFormField(),
    );
  }
}
