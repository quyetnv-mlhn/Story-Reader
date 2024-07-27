// File: lib/core/error/exceptions.dart

class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {this.code});

  @override
  String toString() =>
      'AppException: $message${code != null ? ' (Code: $code)' : ''}';
}

class ServerException extends AppException {
  ServerException(
      [super.message = 'An error occurred while communicating with the server'])
      : super(code: 'SERVER_ERROR');
}

class NetworkException extends AppException {
  NetworkException([super.message = 'A network error occurred'])
      : super(code: 'NETWORK_ERROR');
}

class CacheException extends AppException {
  CacheException([super.message = 'A cache error occurred'])
      : super(code: 'CACHE_ERROR');
}

class ValidationException extends AppException {
  ValidationException([super.message = 'Validation failed'])
      : super(code: 'VALIDATION_ERROR');
}

class AuthenticationException extends AppException {
  AuthenticationException([super.message = 'Authentication failed'])
      : super(code: 'AUTH_ERROR');
}

class NotFoundException extends AppException {
  NotFoundException([super.message = 'The requested resource was not found'])
      : super(code: 'NOT_FOUND');
}

class PermissionException extends AppException {
  PermissionException([super.message = 'Permission denied'])
      : super(code: 'PERMISSION_DENIED');
}

class TimeoutException extends AppException {
  TimeoutException([super.message = 'The operation timed out'])
      : super(code: 'TIMEOUT');
}

class UnexpectedException extends AppException {
  UnexpectedException([super.message = 'An unexpected error occurred'])
      : super(code: 'UNEXPECTED_ERROR');
}
