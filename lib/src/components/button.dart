// src/components/button.dart
import 'package:flutter/material.dart';

class LivingAppButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color borderColor;
  final Color textColor;
  final IconData? icon;
  final bool disabled;

  const LivingAppButton({
    super.key,
    required this.text,
    required this.isLoading,
    required this.onPressed,
    this.backgroundColor,
    this.fontSize = 14,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.margin = EdgeInsets.zero,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.white,
    this.icon,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderColor),
          backgroundColor: disabled
              ? Colors.grey
              : backgroundColor ?? Theme.of(context).primaryColorDark,
          padding: padding,
        ),
        onPressed: disabled ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? Icon(icon, color: textColor)
                      : const SizedBox(),
                  SizedBox(width: icon != null ? 10 : 0),
                  Text(
                    text,
                    style: TextStyle(
                      color: disabled ? Colors.grey : textColor,
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
