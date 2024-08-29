import 'package:story_reader/core/network/network_utils.dart';
import 'package:story_reader/data/models/request/search_stories_request.dart';
import 'package:story_reader/data/models/response/paginated_response.dart';
import 'package:story_reader/data/models/response/story_model.dart';

abstract class StoryRepository {
  Future<Result<PaginatedResponse<Story>>> getStories({
    int? page,
    int? pageSize,
  });

  Future<Result<PaginatedResponse<Story>>> getFeaturedStories(
      {int? page, int? pageSize});

  Future<Result<PaginatedResponse<Story>>> getStoriesRecentlyUpdated({
    int? page,
    int? pageSize,
  });

  Future<Result<PaginatedResponse<Story>>> searchStories(
    SearchStoriesRequest searchStoriesParam,
  );

  Future<Result<Story>> getStoryDetails(String storyId);
// Future<List<Chapter>> getChapters(String storyId);
// Future<Chapter> getChapterContent(String chapterId);
}
