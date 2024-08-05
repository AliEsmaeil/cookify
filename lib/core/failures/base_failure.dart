
abstract class Failure implements Exception{
  final String message;
  const Failure({required this.message});
}

final class UnknownFailure extends Failure{
  const UnknownFailure({required super.message});
}