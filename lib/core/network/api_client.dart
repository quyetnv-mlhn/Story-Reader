import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:story_reader/core/error/exceptions.dart';

import 'package:story_reader/core/network/endpoints.dart';
import 'package:story_reader/core/network/network_utils.dart';
import 'package:story_reader/core/utils/logging_utils.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio.options.baseUrl = Endpoints.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseHeader: true,
      responseBody: false,
    ));
  }

  Future<ApiResponse<T>> get<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return ApiResponse.fromJson(response.data, fromJson);
    } catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);
      throw _handleError(e);
    }
  }

  Future<ApiResponse<T>> post<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return ApiResponse.fromJson(response.data, fromJson);
    } catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return NetworkException('Connection timeout');
        case DioExceptionType.badResponse:
          switch (error.response?.statusCode) {
            case 400:
              return BadRequestException(error.response?.data['message']);
            case 401:
              return UnauthorizedException(error.response?.data['message']);
            case 404:
              return NotFoundException(error.response?.data['message']);
            case 500:
              return ServerException(error.response?.data['message']);
            default:
              return NetworkException(
                  'Bad response: ${error.response?.statusCode}');
          }
        case DioExceptionType.connectionError:
          return NetworkException('Connection error');
        case DioExceptionType.cancel:
          return NetworkException('Request cancelled');
        default:
          return UnexpectedException('Unexpected error occurred');
      }
    } else {
      return UnexpectedException('Unexpected error: $error');
    }
  }
}
