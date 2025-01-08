import 'package:flutter/material.dart';

class SmallRoundedButton extends StatelessWidget {
  const SmallRoundedButton({super.key, this.function, this.icon});

  final icon;
  final function;

  @override
  Widget build(BuildContext context) {
    // GestureDetector wrapped around icon
    return GestureDetector(
      onTap: function,

      // Container around icon
      child: Container(
        height: 32.0,
        width: 32.0,
        decoration: BoxDecoration(
          color: Colors.blueGrey.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(width: 1.0, color: Colors.blueGrey),
        ),

        //icon centered
        child: Center(child: Icon(icon, color: Color(0xFFFFFFFF), size: 28.0)),
      ),
    );
  }
}
