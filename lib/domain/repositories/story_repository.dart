import 'package:story_reader/core/utils/network_utils.dart';
import 'package:story_reader/data/models/response/story_model.dart';
import 'package:story_reader/data/params/search_stories_param.dart';

abstract class StoryRepository {
  Future<Result<List<Story>>> getStories();
  Future<Result<List<Story>>> getStoriesPaginated(int page, int pageSize);
  Future<Result<List<Story>>> searchStories(
      SearchStoriesParam searchStoriesParam);
  Future<Result<Story>> getStoryDetails(String storyId);
  // Future<List<Chapter>> getChapters(String storyId);
  // Future<Chapter> getChapterContent(String chapterId);
}
