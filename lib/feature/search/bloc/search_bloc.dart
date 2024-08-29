import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_reader/data/models/request/search_stories_request.dart';
import 'package:story_reader/data/models/response/story_model.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final StoryRepository storyRepository;

  SearchBloc(this.storyRepository) : super(SearchInitial()) {
    on<PerformSearch>(_onPerformSearch);
    on<LoadMoreResults>(_onLoadMoreResults);
    on<ApplyFilter>(_onApplyFilter);
  }

  SearchStoriesRequest _currentRequest = const SearchStoriesRequest();
  List<Story> _allResults = [];
  bool _hasMore = false;

  Future<void> _onPerformSearch(
    PerformSearch event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());

    _currentRequest = _currentRequest.copyWith(
      title: event.query,
      page: 1,
    );

    final response = await storyRepository.searchStories(_currentRequest);

    response.fold(
      (paginatedResponse) {
        _allResults = paginatedResponse.content;
        _hasMore = paginatedResponse.hasNext;
        emit(SearchLoaded(_allResults, _hasMore));
      },
      (failure) {
        emit(SearchError(failure.message));
      },
    );
  }

  Future<void> _onLoadMoreResults(
    LoadMoreResults event,
    Emitter<SearchState> emit,
  ) async {
    if (!_hasMore) return;

    _currentRequest = _currentRequest.copyWith(
      page: _currentRequest.page + 1,
    );

    final response = await storyRepository.searchStories(_currentRequest);

    response.fold(
      (paginatedResponse) {
        _allResults.addAll(paginatedResponse.content);
        _hasMore = paginatedResponse.hasNext;
        emit(SearchLoaded(_allResults, _hasMore));
      },
      (failure) {
        emit(SearchError(failure.message));
      },
    );
  }

  Future<void> _onApplyFilter(
    ApplyFilter event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());

    _currentRequest = _currentRequest.copyWith(
      author: event.filterCriteria,
      page: 1,
    );

    final response = await storyRepository.searchStories(_currentRequest);

    response.fold(
      (paginatedResponse) {
        _allResults = paginatedResponse.content;
        _hasMore = paginatedResponse.hasNext;
        emit(SearchLoaded(_allResults, _hasMore));
      },
      (failure) {
        emit(SearchError(failure.message));
      },
    );
  }
}
