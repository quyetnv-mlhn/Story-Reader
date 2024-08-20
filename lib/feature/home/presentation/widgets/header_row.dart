import 'package:flutter/material.dart';
import 'package:story_reader/core/theme/spacing_constants.dart';

class HeaderRow extends StatelessWidget {
  final String title;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final TextStyle? titleStyle;
  final TextStyle? buttonTextStyle;
  final double dividerThickness;

  const HeaderRow({
    super.key,
    required this.title,
    this.buttonText,
    this.onButtonPressed,
    this.titleStyle,
    this.buttonTextStyle,
    this.dividerThickness = Spacing.dividerThick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: dividerThickness * 6,
          height: Spacing.iconM,
          color: theme.dividerColor,
          margin: const EdgeInsets.only(right: Spacing.spaceS),
        ),
        Text(
          title,
          style: titleStyle ??
              theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        if (buttonText != null &&
            onButtonPressed != null) // Conditionally render
          HeaderOption(
            text: buttonText!,
            onPressed: onButtonPressed!,
            textStyle: buttonTextStyle,
          ),
      ],
    );
  }
}

class HeaderOption extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const HeaderOption({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.spaceS,
          horizontal: Spacing.spaceM,
        ),
        backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacing.radiusL),
        ),
      ),
      child: Text(
        text,
        style: textStyle ??
            theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
