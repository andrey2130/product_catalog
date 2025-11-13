import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final VoidCallback onPressed;
  final Widget? icon;
  final Widget? svgPicture;
  final bool isLoading;
  final bool? showAnimation;

  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.width,
    this.height,
    this.icon,
    this.svgPicture,
    this.isLoading = false,
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
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.onPrimary,
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (svgPicture != null)
                    svgPicture!
                  else if (icon != null)
                    icon!,
                  if (svgPicture != null || icon != null) SizedBox(width: 8),
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
