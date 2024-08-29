import 'package:flutter/material.dart';
import 'package:story_reader/core/theme/spacing_constants.dart';
import 'package:story_reader/core/utils/date_time_utils.dart';
import 'package:story_reader/core/utils/string_extensions.dart';
import 'package:story_reader/core/widgets/cached_image_widget.dart';
import 'package:story_reader/data/models/response/story_model.dart';

class StoryItem extends StatelessWidget {
  final double width;
  final TextStyle? titleStyle;
  final TextStyle? chapterStyle;
  final Color badgeColor;
  final double badgeRadius;
  final Story story;

  const StoryItem({
    super.key,
    required this.story,
    this.width = 180,
    this.titleStyle,
    this.chapterStyle,
    this.badgeColor = Colors.deepPurple,
    this.badgeRadius = Spacing.radiusM,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.radiusM),
                child: CachedImageWidget(
                  imageUrl: story.coverImage ?? '',
                  height: 150,
                ),
              ),
              Padding(
                padding: Spacing.paddingAllS,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '#${(story.chapter ?? "##").toString()} chap'.hardCoded,
                      style: titleStyle ??
                          theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimary,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: theme.colorScheme.onPrimary,
                          size: Spacing.iconS,
                        ),
                        Spacing.horizontalSpaceS,
                        Expanded(
                          child: Text(
                            DateTimeUtils.getFormattedDate(story.lastUpdate)
                                .hardCoded,
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacing.verticalSpaceS,
          Text(
            story.title ?? ''.hardCoded,
            style: titleStyle ??
                theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
