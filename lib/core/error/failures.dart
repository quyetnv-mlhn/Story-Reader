abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() {
    return 'Failure{message: $message}';
  }
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure() : super('An unexpected error occurred');
}
