part of 'search_bloc.dart';

abstract class SearchEvent {}

class PerformSearch extends SearchEvent {
  final String query;

  PerformSearch(this.query);
}

class LoadMoreResults extends SearchEvent {}

class ApplyFilter extends SearchEvent {
  final String filterCriteria;

  ApplyFilter(this.filterCriteria);
}
