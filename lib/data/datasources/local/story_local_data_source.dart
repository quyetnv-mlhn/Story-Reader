import 'package:story_reader/core/network/network_utils.dart';
import 'package:story_reader/data/models/response/story_model.dart';

abstract class StoryLocalDataSource {
  Future<Result<List<Story>>> getCachedStories();
  Future<void> cacheStories(Result<List<Story>> stories);
}

class StoryLocalDataSourceImpl implements StoryLocalDataSource {
  @override
  Future<void> cacheStories(Result<List<Story>> stories) {
    // TODO: implement cacheStories
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Story>>> getCachedStories() {
    // TODO: implement getCachedStories
    throw UnimplementedError();
  }
}
