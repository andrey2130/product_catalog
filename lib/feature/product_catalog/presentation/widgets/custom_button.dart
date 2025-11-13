import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final VoidCallback onPressed;
  final bool? showAnimation;

  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.width,
    this.height,
    this.showAnimation = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: theme.elevatedButtonTheme.style?.copyWith(
          overlayColor: showAnimation!
              ? null
              : WidgetStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      text,
                      style: theme.elevatedButtonTheme.style?.textStyle
                          ?.resolve({}),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
