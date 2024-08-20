import 'package:story_reader/core/error/exceptions.dart';
import 'package:story_reader/core/utils/logging_utils.dart';

class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;

  ApiResponse({required this.success, required this.message, this.data});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? fromJson(json['data']) : null,
    );
  }

  ApiResponse copyWith({
    bool? success,
    String? message,
    T? data,
  }) {
    return ApiResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

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

Future<Result<T>> handleRequest<T>(
  Future<ApiResponse> Function() request,
) async {
  try {
    final apiResponse = await request();
    if (apiResponse.success && apiResponse.data != null) {
      return Result.success(apiResponse.data);
    } else {
      return Result.failure(ServerException(apiResponse.message));
    }
  } on NetworkException catch (e, stackTrace) {
    logger.e('Network error occurred', error: e, stackTrace: stackTrace);
    return Result.failure(e);
  } on AppException catch (e, stackTrace) {
    logger.e('Application error occurred', error: e, stackTrace: stackTrace);
    return Result.failure(e);
  } catch (e, stackTrace) {
    logger.e('Unexpected error occurred', error: e, stackTrace: stackTrace);
    return Result.failure(UnexpectedException(e.toString()));
  }
}
