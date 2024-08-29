import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_reader/core/theme/spacing_constants.dart';
import 'package:story_reader/core/widgets/custom_app_bar.dart';
import 'package:story_reader/core/widgets/lottie_loading_widget.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';
import 'package:story_reader/feature/home/bloc/home_bloc.dart';
import 'package:story_reader/feature/home/bloc/home_event.dart';
import 'package:story_reader/feature/home/bloc/home_state.dart';
import 'package:story_reader/feature/home/presentation/pages/all_story_list.dart';
import 'package:story_reader/feature/home/presentation/pages/featured_stories.dart';
import 'package:story_reader/feature/home/presentation/pages/new_updated_story_list.dart';
import 'package:story_reader/feature/search/presentation/pages/search_page.dart';
import 'package:story_reader/injection_container.dart';

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
          appBar: CustomAppBar(
            onSearchPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SearchPage();
              }));
            },
            onSettingsPressed: () {},
            title: 'Home',
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return switch (state) {
                HomeLoading() => const LottieLoadingWidget(),
                HomeLoaded() => _buildLoadedContent(state),
                // HomeSearchLoaded() => _buildSearchContent(state),
                HomeError() => Center(
                    child: Text(
                      'Error: ${state.message}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                _ => Container(),
              };
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedContent(HomeLoaded state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FeaturedStories(featuredStories: state.featuredStories),
          Spacing.verticalSpaceM,
          NewUpdatedStoryList(
            stories: state.paginatedStories,
            onButtonPressed: () {},
          ),
          Spacing.verticalSpaceM,
          AllStoryList(stories: state.paginatedStories, onButtonPressed: () {}),
        ],
      ),
    );
  }
}
