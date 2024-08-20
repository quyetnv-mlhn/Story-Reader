import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_reader/core/utils/snackbar_handler.dart';
import 'package:story_reader/data/models/request/search_stories_request.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';
import 'package:story_reader/feature/home/bloc/home_event.dart';
import 'package:story_reader/feature/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final StoryRepository storyRepository;

  HomeBloc({required this.storyRepository}) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<SearchStories>(_onSearchStories);
    // on<ChangePage>(_onChangePage);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    final results = await Future.wait([
      storyRepository.getStories(page: 1, pageSize: 15),
      storyRepository.getFeaturedStories(page: 1, pageSize: 5),
      storyRepository.getStoriesRecentlyUpdated(page: 1, pageSize: 10),
    ]);

    if (results.every((result) => result.isSuccess)) {
      final stories = results[0].data.content;
      final featuredStories = results[1].data.content;
      final recentlyUpdated = results[2].data.content;

      emit(HomeLoaded(
        featuredStories: featuredStories,
        paginatedStories: stories,
        recentlyUpdatedStories: recentlyUpdated,
        currentPage: 1,
      ));
    } else {
      final errorMessage = [results[0], results[1], results[2]]
          .where((result) => result.isFailure)
          .map((result) => result.error.message)
          .join(', ');
      SnackBarHandler.showError(errorMessage);
      emit(HomeError(errorMessage));
    }
  }

  Future<void> _onSearchStories(
    SearchStories event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    final searchParam = SearchStoriesRequest(
      title: event.title,
      author: event.author,
    );
    final searchResults = await storyRepository.searchStories(searchParam);

    searchResults.fold(
      (result) => emit(HomeSearchLoaded(
        searchResults: result,
        currentPage: 1,
        totalPages: 1,
      )),
      (error) => emit(HomeError(error.toString())),
    );
  }

// Future<void> _onChangePage(ChangePage event, Emitter<HomeState> emit) async {
//   if (state is HomeLoaded) {
//     final currentState = state as HomeLoaded;
//     emit(HomeLoading());
//     try {
//       final stories =
//           await storyRepository.getStoriesPaginated(event.page, 10);
//       emit(HomeLoaded(
//         featuredStories: currentState.featuredStories,
//         paginatedStories: stories,
//         recentlyUpdatedStories: currentState.recentlyUpdatedStories,
//         currentPage: event.page,
//         totalPages: currentState.totalPages,
//       ));
//     } catch (e) {
//       emit(HomeError(e.toString()));
//     }
//   }
// }
}
