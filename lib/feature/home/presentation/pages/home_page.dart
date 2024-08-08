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
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: const CustomAppBar(),
          body: Column(
            children: [
              const Padding(
                padding: Spacing.appEdgePadding,
                child: SearchStoriesBar(),
              ),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return switch (state) {
                      HomeLoading() =>
                        const Center(child: CircularProgressIndicator()),
                      HomeLoaded() => _buildLoadedContent(state),
                      HomeSearchLoaded() => _buildSearchContent(state),
                      HomeError() =>
                        Center(child: Text('Error: ${state.message}')),
                      _ => Container(),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedContent(HomeLoaded state) {
    return SingleChildScrollView(
      child: Padding(
        padding: Spacing.appEdgePadding,
        child: Column(
          children: [
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
  }

  Widget _buildSearchContent(HomeSearchLoaded state) {
    return SingleChildScrollView(
      child: Padding(
        padding: Spacing.appEdgePadding,
        child: PaginatedStoryList(
          state: HomeLoaded(
            featuredStories: const [],
            paginatedStories: state.searchResults,
            recentlyUpdatedStories: const [],
            currentPage: state.currentPage,
            totalPages: state.totalPages,
          ),
        ),
      ),
    );
  }
}
