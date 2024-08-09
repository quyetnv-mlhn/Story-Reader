
import 'package:flutter/material.dart';
import 'package:story_reader/core/utils/string_extensions.dart';
import 'package:story_reader/core/widgets/cached_image_widget.dart';

import 'package:story_reader/core/theme/spacing_constants.dart';

class StoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String chapter;
  final double width;
  final double height;
  final TextStyle? titleStyle;
  final TextStyle? chapterStyle;
  final Color badgeColor;
  final double badgeRadius;

  const StoryItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.chapter,
    this.width = 180,
    this.height = 220,
    this.titleStyle,
    this.chapterStyle,
    this.badgeColor = Colors.deepPurple, this.badgeRadius = Spacing.radiusM
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.radiusM),
                child: CachedImageWidget(
                  imageUrl: imageUrl,
                  height: height * 0.7,
                ),
              ),
              Positioned(
                bottom: Spacing.spaceS,
                left: Spacing.spaceS,
                child: Text(
                  '#12 chap'.hardCoded,
                  style: titleStyle ??
                      theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Spacing.verticalSpaceM,
          Text(
            title,
            style: titleStyle ??
                theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: Spacing.spaceS,
              horizontal: Spacing.spaceS,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(badgeRadius),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  color: theme.colorScheme.onPrimary,
                  size: Spacing.iconS,
                ),
                Spacing.horizontalSpaceS,
                Expanded(
                  child: Text(
                    chapter,
                    style: chapterStyle ??
                        theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
