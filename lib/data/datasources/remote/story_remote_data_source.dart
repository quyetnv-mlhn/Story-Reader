import 'package:story_reader/core/network/api_client.dart';
import 'package:story_reader/core/network/endpoints.dart';
import 'package:story_reader/core/utils/network_utils.dart';
import 'package:story_reader/data/models/paginated_response.dart';
import 'package:story_reader/data/params/search_stories_param.dart';
import '../../models/story_model.dart';

abstract class StoryRemoteDataSource {
  Future<Result<List<Story>>> getStories();
  Future<Result<List<Story>>> getStoriesPaginated(int page, int pageSize);
  Future<Result<List<Story>>> searchStories(
      SearchStoriesParam searchStoriesParam);
  Future<Result<Story>> getStoryDetails(String storyId);
  // Future<List<Chapter>> getChapters(String storyId);
  // Future<Chapter> getChapterContent(String chapterId);
}

class StoryRemoteDataSourceImpl implements StoryRemoteDataSource {
  final ApiClient _apiClient;

  StoryRemoteDataSourceImpl({required ApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<Result<List<Story>>> getStories() async {
    return handleRequest(() async {
      final queryParameters = {
        'page': 1,
        'pageSize': 10,
      };
      final response = await _apiClient.get(
        Endpoints.getStories,
        queryParameters: queryParameters,
      );
      final data =
          PaginatedResponse<Story>.fromMap(response.data, Story.fromMap);
      return data.content;
    });
  }

  @override
  Future<Result<List<Story>>> getStoriesPaginated(
      int page, int pageSize) async {
    return handleRequest(() async {
      final response = await _apiClient.get(
        Endpoints.getStories,
        queryParameters: {'page': page, 'pageSize': pageSize},
      );
      return (response.data as List)
          .map((json) => Story.fromMap(json))
          .toList();
    });
  }

  @override
  Future<Result<List<Story>>> searchStories(
    SearchStoriesParam searchStoriesParam,
  ) async {
    return handleRequest(() async {
      final response = await _apiClient.get('/stories/search',
          queryParameters: searchStoriesParam.toMap());
      return (response.data as List)
          .map((json) => Story.fromMap(json))
          .toList();
    });
  }

  @override
  Future<Result<Story>> getStoryDetails(String storyId) async {
    return handleRequest(() async {
      final response = await _apiClient.get('/stories/$storyId');
      return Story.fromMap(response.data);
    });
  }

  // @override
  // Future<List<Chapter>> getChapters(String storyId) async {
  //   return handleRequest(() async {
  //     final response = await apiClient.get('/stories/$storyId/chapters');
  //     return (response.data as List).map((json) => Chapter.fromMap(json)).toList();
  //   });
  // }

  // @override
  // Future<Chapter> getChapterContent(String chapterId) async {
  //   return handleRequest(() async {
  //     final response = await apiClient.get('/chapters/$chapterId');
  //     return Chapter.fromMap(response.data);
  //   });
  // }
}
