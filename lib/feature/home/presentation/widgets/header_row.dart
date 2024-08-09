import 'package:flutter/material.dart';
import 'package:story_reader/core/theme/spacing_constants.dart';

class HeaderRow extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final TextStyle? titleStyle;
  final TextStyle? buttonTextStyle;
  final double dividerThickness;

  const HeaderRow({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onButtonPressed,
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
        TextButton(
          onPressed: onButtonPressed,
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
            buttonText,
            style: buttonTextStyle ??
                theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}