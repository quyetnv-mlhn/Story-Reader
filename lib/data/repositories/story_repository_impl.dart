import 'package:story_reader/core/utils/network_utils.dart';
import 'package:story_reader/data/datasources/remote/story_remote_data_source.dart';
import 'package:story_reader/data/models/response/story_model.dart';
import 'package:story_reader/data/params/search_stories_param.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';
import 'package:story_reader/core/utils/snackbar_handler.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryRemoteDataSource remoteDataSource;

  StoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<List<Story>>> getStories() async {
    final result = await remoteDataSource.getStories();
    return result.fold(
      (stories) => Result.success(stories),
      (error) {
        SnackBarHandler.showError('Failed to fetch stories: ${error.message}');
        return Result.failure(error);
      },
    );
  }

  @override
  Future<Result<List<Story>>> getStoriesPaginated(
      int page, int pageSize) async {
    try {
      return await remoteDataSource.getStoriesPaginated(page, pageSize);
    } catch (e) {
      SnackBarHandler.showError('Failed to fetch paginated stories: $e');
      throw Exception('Failed to fetch paginated stories');
    }
  }

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
    SearchStoriesParam searchStoriesParam,
  ) async {
    try {
      return await remoteDataSource.searchStories(searchStoriesParam);
    } catch (e) {
      SnackBarHandler.showError('Failed to search stories: $e');
      throw Exception('Failed to search stories');
    }
  }

// Implement other methods similarly...
}
