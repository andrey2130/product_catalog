import 'package:flutter/material.dart';

class BasketQuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const BasketQuantityButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
