import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeData extends HomeEvent {}

class SearchStories extends HomeEvent {
  final String query;

  const SearchStories(this.query);

  @override
  List<Object> get props => [query];
}

class ChangePage extends HomeEvent {
  final int page;

  const ChangePage(this.page);

  @override
  List<Object> get props => [page];
}