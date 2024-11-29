part of 'failure.dart';

/// A class representing a server failure, extending the [Failure] class.
/// 
/// This class encapsulates a [ServerException] and provides a custom
/// implementation of the [toString] method to include the exception details.
/// 
/// The [title] property is a constant string that describes the type of failure.
/// 
/// Example usage:
/// ```dart
/// try {
///   // Some server-related code that might throw a ServerException
/// } catch (e) {
///   throw ServerFailure(e);
/// }
/// ```
/// 
/// Properties:
/// - `exception`: The [ServerException] that caused this failure.
/// - `title`: A constant string describing the type of failure.
final class ServerFailure extends Failure {
  final ServerException exception;

  static const String title = 'Server Failure';

  const ServerFailure(this.exception) : super('');

  @override
  String toString() => 'Failure: ServerFailure\nException: $exception';
}
