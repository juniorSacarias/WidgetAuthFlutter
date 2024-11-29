/// Exception thrown when a server error occurs.
///
/// This exception includes the status code, an optional message, the error
/// object, and the stack trace.
///
/// The [ServerException] class implements the [Exception] interface and
/// provides a detailed description of the server error.
///
/// Properties:
/// - `statusCode`: The status code returned by the server.
/// - `message`: An optional message describing the error. Defaults to
///   'Server error occurred'.
/// - `error`: The error object associated with the server error.
/// - `stackTrace`: The stack trace at the point where the exception was thrown.
///
/// Example usage:
/// ```dart
/// try {
///   // Code that might throw a ServerException
/// } catch (e) {
///   if (e is ServerException) {
///     print(e);
///   }
/// }
/// ```
///
/// The `toString` method provides a detailed description of the exception,
/// including the status code, message, error, and stack trace.
/// 
class ServerException implements Exception {
  final String statusCode;
  final String? message;
  final Object error;
  final StackTrace stackTrace;

  static const String defaultMessage = 'Server error ocurred';

  const ServerException(
    this.statusCode,
    this.error, {
    required this.stackTrace,
    this.message = defaultMessage,
  });

  @override
  String toString() => 'ServerException\n'
      'Status code: $statusCode\n'
      'Message: $message\n'
      'Error: $error\n\n'
      'StackTrace: $stackTrace';
}
