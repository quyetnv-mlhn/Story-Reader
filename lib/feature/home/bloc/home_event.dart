import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeData extends HomeEvent {}

class SearchStories extends HomeEvent {
  final String title;

  final String author;

  const SearchStories({
    this.title = '',
    this.author = '',
  });

  @override
  List<Object> get props => [title, author];
}

class ChangePage extends HomeEvent {
  final int page;

  const ChangePage(this.page);

  @override
  List<Object> get props => [page];
}
