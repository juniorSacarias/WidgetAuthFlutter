import 'package:coffe_menu/cores/error/server_exception.dart';
import 'package:equatable/equatable.dart';

part 'server_failure.dart';
part 'unknown_failure.dart';

/// A sealed class representing a failure, extending Equatable for value comparison.
/// 
/// This class is intended to be used as a base class for different types of failures
/// that can occur in the application. It contains a message describing the failure.
/// 
/// Properties:
/// - `message`: A string containing the error message.
/// 
/// Overrides:
/// - `props`: A list of properties to be used for equality comparison, which is empty in this base class.
sealed class Failure extends Equatable {
  const Failure(String message);

  @override
  List<Object> get props => [];
}
