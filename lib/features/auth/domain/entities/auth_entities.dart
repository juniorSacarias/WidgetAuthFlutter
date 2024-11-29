import 'package:equatable/equatable.dart';

/// A class representing authentication entities.
///
/// This class is used to encapsulate the authentication details such as
/// username, password, and token.
///
/// Extends [Equatable] to allow for value comparison.
///
/// Properties:
/// - `userName` (String): The username of the user. This field is required.
/// - `password` (String?): The password of the user. This field is optional.
/// - `token` (String): The authentication token. This field is required.
class AuthEntities extends Equatable {
  final String userName;
  final String? password;
  final String token;

  const AuthEntities({
    required this.userName,
    this.password,
    required this.token,
  });

  @override
  List<Object?> get props => [userName, password, token];
}
