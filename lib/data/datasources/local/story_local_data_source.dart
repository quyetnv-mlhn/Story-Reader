
import 'package:story_reader/data/models/story_model.dart';

abstract class StoryLocalDataSource {
  Future<List<Story>> getCachedStories();
  Future<void> cacheStories(List<Story> stories);
}

class StoryLocalDataSourceImpl implements StoryLocalDataSource {
  @override
  Future<void> cacheStories(List<Story> stories) {
    // TODO: implement cacheStories
    throw UnimplementedError();
  }

  @override
  Future<List<Story>> getCachedStories() {
    // TODO: implement getCachedStories
    throw UnimplementedError();
  }
}
