import 'package:flutter/material.dart';
import 'package:story_reader/core/theme/spacing_constants.dart';
import 'package:story_reader/data/models/response/story_model.dart';
import 'package:story_reader/feature/home/presentation/widgets/header_row.dart';
import 'package:story_reader/feature/home/presentation/widgets/story_card.dart';

class AllStoryList extends StatelessWidget {
  final List<Story> stories;
  final String title;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final TextStyle? titleStyle;
  final TextStyle? buttonTextStyle;
  final Color dividerColor;
  final double dividerThickness;

  const AllStoryList({
    super.key,
    required this.stories,
    this.title = 'Tất cả truyện',
    this.buttonText = 'Xem Thêm',
    required this.onButtonPressed,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderRow(
            title: title,
            buttonText: buttonText,
            onButtonPressed: onButtonPressed,
            titleStyle: titleStyle,
            buttonTextStyle: buttonTextStyle,
            dividerThickness: dividerThickness,
          ),
          Spacing.verticalSpaceM,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: stories.length,
            separatorBuilder: (context, index) => Spacing.verticalSpaceM,
            itemBuilder: (context, index) {
              final story = stories[index];
              return StoryCard(
                story: story,
              );
            },
          ),
        ],
      ),
    );
  }
}
