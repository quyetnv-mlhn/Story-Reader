import 'dart:developer';
import 'package:story_reader/core/error/exceptions.dart';

class Result<T> {
  final T? _data;
  final AppException? _error;

  const Result._({T? data, AppException? error})
      : _data = data,
        _error = error;

  factory Result.success(T data) => Result._(data: data);
  factory Result.failure(AppException error) => Result._(error: error);

  bool get isSuccess => _error == null;
  bool get isFailure => _error != null;

  T get data {
    if (_data != null) {
      return _data;
    }
    throw StateError('Cannot access data on failure result');
  }

  AppException get error {
    if (_error != null) {
      return _error;
    }
    throw StateError('Cannot access error on success result');
  }

  R fold<R>(R Function(T) onSuccess, R Function(AppException) onFailure) {
    if (isSuccess && _data != null) {
      return onSuccess(_data);
    } else if (isFailure && _error != null) {
      return onFailure(_error);
    }
    throw StateError('Invalid state: both data and error are null');
  }

  Result<R> map<R>(R Function(T) transform) {
    return isSuccess && _data != null
        ? Result.success(transform(_data))
        : Result.failure(_error ?? UnexpectedException('Unknown error'));
  }

  Result<R> flatMap<R>(Result<R> Function(T) transform) {
    return isSuccess && _data != null
        ? transform(_data)
        : Result.failure(_error ?? UnexpectedException('Unknown error'));
  }

  /*
   * 5. Example of chaining operations
    Future<void> processAndDisplayStories(StoryRepository repository) async {
      final result = await repository.getStories();

      final processedResult = result
          .map((stories) => stories.where((story) => story.rating > 4).toList())
          .flatMap((highRatedStories) =>
      highRatedStories.isEmpty
          ? Result.failure(AppException("No high-rated stories found"))
          : Result.success(highRatedStories)
      );

      processedResult.fold(
              (stories) => displayStories(stories),
              (error) => showErrorMessage(error.message)
      );
    }
  */

  @override
  String toString() => isSuccess ? 'Success($_data)' : 'Failure($_error)';
}

Future<Result<T>> handleRequest<T>(Future<T> Function() request) async {
  try {
    final data = await request();
    return Result.success(data);
  } on NetworkException catch (e) {
    log('Network error: ${e.message}',
        error: e, stackTrace: StackTrace.current);
    return Result.failure(e);
  } on AppException catch (e) {
    log('Application error: ${e.message}',
        error: e, stackTrace: StackTrace.current);
    return Result.failure(e);
  } catch (e, stackTrace) {
    log('Unexpected error', error: e, stackTrace: stackTrace);
    return Result.failure(UnexpectedException(e.toString()));
  }
}
