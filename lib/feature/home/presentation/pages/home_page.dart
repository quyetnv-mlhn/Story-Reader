import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_reader/core/widgets/cached_image_widget.dart';
import 'package:story_reader/data/models/story_model.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';
import 'package:story_reader/feature/home/presentation/bloc/home_bloc.dart';
import 'package:story_reader/feature/home/presentation/bloc/home_event.dart';
import 'package:story_reader/feature/home/presentation/bloc/home_state.dart';
import 'package:story_reader/feature/home/presentation/widgets/story_card.dart';
import 'package:story_reader/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(storyRepository: sl<StoryRepository>())
        ..add(
          LoadHomeData(),
        ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Story Reader')),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSearchBar(context),
                    _buildFeaturedStories(state.featuredStories),
                    _buildPaginatedStoryList(context, state),
                    _buildRecentlyUpdatedStories(state.recentlyUpdatedStories),
                  ],
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

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search stories...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (query) {
          context.read<HomeBloc>().add(SearchStories(query));
        },
      ),
    );
  }

  Widget _buildFeaturedStories(List<Story> featuredStories) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: featuredStories.map((story) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  CachedImageWidget(imageUrl: story.coverImage ?? ''),
                  Center(
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        story.title ?? '',
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildPaginatedStoryList(BuildContext context, HomeLoaded state) {
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
        _buildPagination(context, state),
      ],
    );
  }

  Widget _buildPagination(BuildContext context, HomeLoaded state) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(state.totalPages, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(ChangePage(index + 1));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    state.currentPage == index + 1 ? Colors.blue : Colors.grey,
              ),
              child: Text('${index + 1}'),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildRecentlyUpdatedStories(List<Story> recentlyUpdatedStories) {
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
