abstract class FailureError {
  final String message;

  FailureError({required this.message});
}
class ServerFailure extends FailureError{
  ServerFailure({required super.message});
}