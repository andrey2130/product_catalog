import 'package:flutter/material.dart';

class CircularActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final MaterialColor backgroundColor;
  final MaterialColor iconColor;

  const CircularActionButton({
    required this.icon,
    required this.onTap,
    this.backgroundColor = Colors.red,
    this.iconColor = Colors.red,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor.shade50,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(6),
        child: Icon(
          icon,
          color: iconColor.shade400,
        ),
      ),
    );
  }
}

