import 'package:flutter/material.dart';

import '../bloc/home_state.dart';
import 'pagination.dart';
import 'story_card.dart';

class PaginatedStoryList extends StatelessWidget {
  final HomeLoaded state;

  const PaginatedStoryList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.paginatedStories.length,
          itemBuilder: (context, index) {
            return StoryCard(story: state.paginatedStories[index]);
          },
        ),
        Pagination(state: state),
      ],
    );
  }
}
