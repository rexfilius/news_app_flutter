abstract class NetworkResult<T> {}

class NetworkSuccess<T> extends NetworkResult<T> {
  final T value;

  NetworkSuccess(this.value);
}

class NetworkError<T> extends NetworkResult<T> {
  final Exception exception;

  NetworkError(this.exception);
}
