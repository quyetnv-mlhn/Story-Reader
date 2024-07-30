import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final StoryRepository storyRepository;

  HomeBloc({required this.storyRepository}) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    // on<SearchStories>(_onSearchStories);
    // on<ChangePage>(_onChangePage);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final result = await storyRepository.getStories();

    result.fold(
      (stories) => emit(HomeLoaded(
        featuredStories: stories.take(5).toList(),
        paginatedStories: stories.skip(5).take(10).toList(),
        recentlyUpdatedStories: stories.reversed.take(5).toList(),
        currentPage: 1,
        totalPages: (stories.length / 10).ceil(),
      )),
      (error) => emit(HomeError(error.message)),
    );
  }

  // Future<void> _onSearchStories(
  //     SearchStories event, Emitter<HomeState> emit) async {
  //   emit(HomeLoading());
  //   try {
  //     final searchResults = await storyRepository.searchStories(event.query);
  //     emit(HomeLoaded(
  //       featuredStories: const [], // Không có featured stories trong kết quả tìm kiếm
  //       paginatedStories: searchResults,
  //       recentlyUpdatedStories: const [], // Không có recently updated stories trong kết quả tìm kiếm
  //       currentPage: 1,
  //       totalPages: (searchResults.length / 10).ceil(),
  //     ));
  //   } catch (e) {
  //     emit(HomeError(e.toString()));
  //   }
  // }

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
