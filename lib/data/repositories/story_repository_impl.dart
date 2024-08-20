import 'package:story_reader/core/network/network_utils.dart';
import 'package:story_reader/core/utils/snackbar_handler.dart';
import 'package:story_reader/data/datasources/remote/story_remote_data_source.dart';
import 'package:story_reader/data/models/request/search_stories_request.dart';
import 'package:story_reader/data/models/response/paginated_response.dart';
import 'package:story_reader/data/models/response/story_model.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryRemoteDataSource remoteDataSource;

  StoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<PaginatedResponse<Story>>> getStories({
    int? page,
    int? pageSize,
  }) =>
      remoteDataSource.getStories(page: page, pageSize: pageSize);

  @override
  Future<Result<Story>> getStoryDetails(String storyId) async {
    try {
      return await remoteDataSource.getStoryDetails(storyId);
    } catch (e) {
      SnackBarHandler.showError('Failed to fetch story details: $e');
      throw Exception('Failed to fetch story details');
    }
  }

  @override
  Future<Result<List<Story>>> searchStories(
    SearchStoriesRequest searchStoriesParam,
  ) async {
    try {
      return await remoteDataSource.searchStories(searchStoriesParam);
    } catch (e) {
      SnackBarHandler.showError('Failed to search stories: $e');
      throw Exception('Failed to search stories');
    }
  }

  @override
  Future<Result<PaginatedResponse<Story>>> getFeaturedStories({
    int? page,
    int? pageSize,
  }) =>
      remoteDataSource.getFeaturedStories(page: page, pageSize: pageSize);

  @override
  Future<Result<PaginatedResponse<Story>>> getStoriesRecentlyUpdated({
    int? page,
    int? pageSize,
  }) =>
      remoteDataSource.getStoriesRecentlyUpdated(
          page: page, pageSize: pageSize);

// Implement other methods similarly...
}
