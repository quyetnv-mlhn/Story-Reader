import 'package:story_reader/core/network/api_client.dart';
import 'package:story_reader/core/network/endpoints.dart';
import 'package:story_reader/core/network/network_utils.dart';
import 'package:story_reader/data/models/request/get_stories_request.dart';
import 'package:story_reader/data/models/request/search_stories_request.dart';
import 'package:story_reader/data/models/response/paginated_response.dart';
import 'package:story_reader/data/models/response/story_model.dart';

abstract class StoryRemoteDataSource {
  Future<Result<PaginatedResponse<Story>>> getStories(
      {int? page, int? pageSize});

  Future<Result<List<Story>>> searchStories(
    SearchStoriesRequest searchStoriesParam,
  );

  Future<Result<Story>> getStoryDetails(String storyId);

  Future<Result<PaginatedResponse<Story>>> getFeaturedStories(
      {int? page, int? pageSize});

  Future<Result<PaginatedResponse<Story>>> getStoriesRecentlyUpdated({
    int? page,
    int? pageSize,
  });
}

class StoryRemoteDataSourceImpl implements StoryRemoteDataSource {
  final ApiClient _apiClient;

  StoryRemoteDataSourceImpl({required ApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<Result<PaginatedResponse<Story>>> getStories({
    int? page,
    int? pageSize,
  }) async {
    final queryParameters = GetStoriesRequest(
      page: page ?? 0,
      pageSize: pageSize ?? 0,
    );

    return handleRequest(
      () => _apiClient.get(
        Endpoints.getStories,
        fromJson: (json) => PaginatedResponse.fromMap(json, Story.fromMap),
        queryParameters: queryParameters.toMap(),
      ),
    );
  }

  @override
  Future<Result<List<Story>>> searchStories(
      SearchStoriesRequest searchStoriesParam) async {
    return handleRequest(() async {
      final response = await _apiClient.get(
        '/stories/search',
        fromJson: (json) => Story.fromMap(json),
        queryParameters: searchStoriesParam.toMap(),
      );

      final stories =
          (response.data as List).map((json) => Story.fromMap(json)).toList();

      return ApiResponse<List<Story>>(
        success: true,
        message: 'Search results fetched successfully',
        data: stories,
      );
    });
  }

  @override
  Future<Result<Story>> getStoryDetails(String storyId) => handleRequest(
        () async {
          final response = await _apiClient.get('/stories/$storyId',
              fromJson: (json) => Story.fromMap(json));

          return response;
        },
      );

  @override
  Future<Result<PaginatedResponse<Story>>> getFeaturedStories({
    int? page,
    int? pageSize,
  }) =>
      handleRequest(() async {
        final queryParameters = GetStoriesRequest(
          page: page ?? 1,
          pageSize: pageSize ?? 5,
        );
        return await _apiClient.get(
          Endpoints.getFeaturedStories,
          fromJson: (json) => PaginatedResponse.fromMap(json, Story.fromMap),
          queryParameters: queryParameters.toMap(),
        );
      });

  @override
  Future<Result<PaginatedResponse<Story>>> getStoriesRecentlyUpdated({
    int? page,
    int? pageSize,
  }) =>
      handleRequest(() async {
        final queryParameters = GetStoriesRequest(
          page: page ?? 1,
          pageSize: pageSize ?? 10,
        );
        return await _apiClient.get(
          Endpoints.getStoriesRecentlyUpdated,
          fromJson: (json) => PaginatedResponse.fromMap(json, Story.fromMap),
          queryParameters: queryParameters.toMap(),
        );
      });

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
