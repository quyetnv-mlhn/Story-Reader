import 'package:equatable/equatable.dart';
import 'package:story_reader/data/models/response/story_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Story> featuredStories;
  final List<Story> paginatedStories;
  final List<Story> recentlyUpdatedStories;
  final int currentPage;
  final String searchQuery;

  const HomeLoaded({
    required this.featuredStories,
    required this.paginatedStories,
    required this.recentlyUpdatedStories,
    required this.currentPage,
    this.searchQuery = '',
  });

  @override
  List<Object> get props => [
        featuredStories,
        paginatedStories,
        recentlyUpdatedStories,
        currentPage,
        searchQuery,
      ];
}

class HomeSearchLoaded extends HomeState {
  final List<Story> searchResults;
  final int currentPage;
  final int totalPages;

  const HomeSearchLoaded({
    required this.searchResults,
    required this.currentPage,
    required this.totalPages,
  });
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
