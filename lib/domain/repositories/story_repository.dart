import 'package:story_reader/core/utils/network_utils.dart';
import 'package:story_reader/data/models/story_model.dart';

abstract class StoryRepository {
  Future<Result<List<Story>>> getStories();
  Future<Result<List<Story>>> getStoriesPaginated(int page, int pageSize);
  Future<Result<List<Story>>> searchStories(String query);
  Future<Result<Story>> getStoryDetails(String storyId);
  // Future<List<Chapter>> getChapters(String storyId);
  // Future<Chapter> getChapterContent(String chapterId);
}
