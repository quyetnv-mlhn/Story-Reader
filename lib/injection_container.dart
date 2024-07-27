import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:story_reader/core/network/api_client.dart';
import 'package:story_reader/data/datasources/local/story_local_data_source.dart';
import 'package:story_reader/data/datasources/remote/story_remote_data_source.dart';
import 'package:story_reader/data/repositories/story_repository_impl.dart';
import 'package:story_reader/domain/repositories/story_repository.dart';
import 'package:story_reader/feature/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencyInjection() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl<Dio>()));

  sl.registerLazySingleton<StoryRemoteDataSource>(
    () => StoryRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );
  sl.registerLazySingleton<StoryLocalDataSource>(
    () => StoryLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<StoryRepository>(
    () => StoryRepositoryImpl(
      remoteDataSource: sl<StoryRemoteDataSource>(),
      localDataSource: sl<StoryLocalDataSource>(),
    ),
  );

  sl.registerFactory(() => HomeBloc(storyRepository: sl<StoryRepository>()));
}
