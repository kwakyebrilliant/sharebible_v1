import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({super.key, this.text, this.function});

  final text;
  final function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 335.0,
          height: 56.0,
          color: const Color.fromRGBO(247, 247, 250, 1),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.rubik(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
