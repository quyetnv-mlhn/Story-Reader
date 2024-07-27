import 'package:story_reader/data/models/story_model.dart';

abstract class StoryRepository {
  Future<List<Story>> getStories();
  Future<List<Story>> getStoriesPaginated(int page, int pageSize);
  Future<List<Story>> searchStories(String query);
  Future<Story> getStoryDetails(String storyId);
  // Future<List<Chapter>> getChapters(String storyId);
  // Future<Chapter> getChapterContent(String chapterId);
}
