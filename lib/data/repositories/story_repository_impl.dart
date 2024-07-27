import 'package:story_reader/data/datasources/local/story_local_data_source.dart';
import 'package:story_reader/data/datasources/remote/story_remote_data_source.dart';
import 'package:story_reader/data/models/story_model.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryRemoteDataSource remoteDataSource;
  final StoryLocalDataSource localDataSource;
  // final NetworkInfo networkInfo;

  StoryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    // required this.networkInfo,
  });

  @override
  Future<List<Story>> getStories() async {
    // if (await networkInfo.isConnected) {
    if (true) {
      try {
        final remoteStories = await remoteDataSource.getStories();
        // localDataSource.cacheStories(remoteStories);
        return remoteStories;
      } catch (e) {
        print(e);
        return localDataSource.getCachedStories();
      }
    } else {
      return localDataSource.getCachedStories();
    }
  }

  @override
  Future<List<Story>> getStoriesPaginated(int page, int pageSize) async {
    return remoteDataSource.getStoriesPaginated(page, pageSize);
  }

  @override
  Future<Story> getStoryDetails(String storyId) {
    // TODO: implement getStoryDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Story>> searchStories(String query) {
    // TODO: implement searchStories
    throw UnimplementedError();
  }

// Implement other methods similarly...
}
