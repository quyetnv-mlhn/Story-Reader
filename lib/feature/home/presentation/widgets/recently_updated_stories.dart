import 'package:flutter/material.dart';
import 'package:story_reader/data/models/story_model.dart';

import 'story_card.dart';

class RecentlyUpdatedStories extends StatelessWidget {
  final List<Story> recentlyUpdatedStories;

  const RecentlyUpdatedStories(
      {super.key, required this.recentlyUpdatedStories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Recently Updated',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentlyUpdatedStories.length,
          itemBuilder: (context, index) {
            return StoryCard(story: recentlyUpdatedStories[index]);
          },
        ),
      ],
    );
  }
}
