import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_reader/core/widgets/lottie_loading_widget.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';
import 'package:story_reader/feature/home/presentation/widgets/story_item.dart';
import 'package:story_reader/feature/search/bloc/search_bloc.dart';
import 'package:story_reader/feature/search/presentation/widgets/search_stories_bar.dart';
import 'package:story_reader/injection_container.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(sl<StoryRepository>()),
      child: const SearchPageView(),
    );
  }
}

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchStoriesBar(
          onSearch: (String query) {
            context.read<SearchBloc>().add(PerformSearch(query));
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return switch (state) {
            SearchLoading() => const LottieLoadingWidget(),
            SearchLoaded() => _buildSearchContent(context, state),
            SearchError() => Center(
                child: Text(
                  'Error: ${state.message}',
                  textAlign: TextAlign.center,
                ),
              ),
            _ => const Center(
                child: Text('Please enter a search term to find stories.'),
              ),
          };
        },
      ),
    );
  }

  Widget _buildSearchContent(BuildContext context, SearchLoaded state) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.extentAfter < 200 && state.hasMore) {
        context.read<SearchBloc>().add(LoadMoreResults());
      }
    });

    return ListView.builder(
      controller: scrollController,
      itemCount: state.results.length + 1,
      itemBuilder: (context, index) {
        if (index < state.results.length) {
          return StoryItem(story: state.results[index]);
        } else if (state.hasMore) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
