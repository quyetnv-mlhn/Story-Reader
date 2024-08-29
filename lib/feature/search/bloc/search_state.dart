part of 'search_bloc.dart';

// search_state.dart
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Story> results;
  final bool hasMore;

  SearchLoaded(this.results, this.hasMore);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
