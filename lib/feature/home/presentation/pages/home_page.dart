import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_reader/core/theme/spacing_constants.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';
import 'package:story_reader/feature/home/presentation/bloc/home_bloc.dart';
import 'package:story_reader/feature/home/presentation/bloc/home_event.dart';
import 'package:story_reader/feature/home/presentation/bloc/home_state.dart';
import 'package:story_reader/feature/home/presentation/widgets/search_stories_bar.dart';
import 'package:story_reader/injection_container.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/featured_stories.dart';
import '../widgets/paginated_story_list.dart';
import '../widgets/recently_updated_stories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(storyRepository: sl<StoryRepository>())..add(LoadHomeData()),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: Spacing.appEdgePadding,
                  child: Column(
                    children: [
                      const SearchStoriesBar(),
                      Spacing.verticalSpaceM,
                      FeaturedStories(featuredStories: state.featuredStories),
                      Spacing.verticalSpaceM,
                      PaginatedStoryList(state: state),
                      Spacing.verticalSpaceM,
                      RecentlyUpdatedStories(
                        recentlyUpdatedStories: state.recentlyUpdatedStories,
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is HomeError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
