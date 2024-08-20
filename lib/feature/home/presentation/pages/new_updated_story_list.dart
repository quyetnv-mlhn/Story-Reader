import 'package:flutter/material.dart';
import 'package:story_reader/core/theme/spacing_constants.dart';
import 'package:story_reader/core/utils/date_time_utils.dart';
import 'package:story_reader/data/models/response/story_model.dart';
import 'package:story_reader/feature/home/presentation/widgets/story_item.dart';
import 'package:story_reader/feature/home/presentation/widgets/header_row.dart';

class NewUpdatedStoryList extends StatelessWidget {
  final List<Story> stories;
  final String title;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final double height;
  final TextStyle? titleStyle;
  final TextStyle? buttonTextStyle;
  final Color dividerColor;
  final double dividerThickness;

  const NewUpdatedStoryList({
    super.key,
    required this.stories,
    this.title = 'Mới cập nhật',
    this.buttonText = 'Xem Thêm',
    required this.onButtonPressed,
    this.height = 180,
    this.titleStyle,
    this.buttonTextStyle,
    this.dividerColor = Colors.grey,
    this.dividerThickness = Spacing.dividerThick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Spacing.appEdgePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderRow(
            title: title,
            titleStyle: titleStyle,
            dividerThickness: dividerThickness,
          ),
          Spacing.verticalSpaceM,
          SizedBox(
            height: height,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              separatorBuilder: (context, index) => Spacing.horizontalSpaceS,
              itemBuilder: (context, index) {
                final story = stories[index];
                return StoryItem(
                  imageUrl: story.coverImage ?? '',
                  title: story.title ?? '',
                  chapter: story.chapter,
                  lastUpdate: DateTimeUtils.getFormattedDate(story.lastUpdate),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
