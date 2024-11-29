part of 'failure.dart';

/// A class representing an unknown failure that extends the [Failure] class.
/// 
/// This class is used to handle cases where the specific type of failure is not known.
/// 
/// Example usage:
/// ```dart
/// final failure = UnknownFailure('An unknown error occurred');
/// ```
/// 
/// The [message] parameter is a string that describes the failure.
class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
