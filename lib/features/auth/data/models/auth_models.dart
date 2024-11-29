import 'package:coffe_menu/features/auth/domain/entities/auth_entities.dart';

/// A model class that extends [AuthEntities] to represent authentication data.
///
/// The [AuthModels] class includes the following properties:
/// - `userName`: The username of the authenticated user.
/// - `password`: The password of the authenticated user (optional).
/// - `token`: The authentication token.
///
/// The class provides a factory constructor [AuthModels.fromJson] to create an instance
/// from a JSON map.
class AuthModels extends AuthEntities {
  const AuthModels({
    required super.userName,
    super.password,
    required super.token,
  });

  factory AuthModels.fromJson(Map<String, dynamic> json) {
    return AuthModels(
      userName: json['userName'],
      password: json['password'],
      token: json['token'],
    );
  }
}
