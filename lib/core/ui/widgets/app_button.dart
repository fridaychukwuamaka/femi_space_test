import 'package:flutter/material.dart';

import '../../extensions/extension.dart';
import '../themes/theme.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    required this.onPressed,
    this.buttonTitle,
    this.isLoadable = true,
    this.borderRadius = 108,
    this.width,
    this.disabled = false,
    this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16,
    ),
    super.key,
  });

  final String? buttonTitle;
  final Function() onPressed;
  final bool isLoadable;
  final double? width;
  final double borderRadius;
  final EdgeInsets padding;
  final bool disabled;
  final Widget? child;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: widget.padding,
          disabledForegroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          foregroundColor: context.colorScheme.onPrimary,
        ),
        child: widget.child ??
            Text(
              widget.buttonTitle!,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
      ),
    );
  }
}
