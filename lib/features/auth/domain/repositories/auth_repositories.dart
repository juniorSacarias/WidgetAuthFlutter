import 'package:coffe_menu/features/auth/domain/entities/auth_entities.dart';

/// An abstract class that defines the contract for authentication repositories.
/// 
/// This class provides methods for logging in and logging out users.
abstract class AuthRepositories {
  /// Logs in a user with the provided [userName] and [password].
  ///
  /// Returns an [AuthEntities] object containing the user's authentication details.
  ///
  /// Throws an [AuthException] if the login fails.
  Future<AuthEntities> login(String userName, String password);

  /// Logs out the currently authenticated user.
  ///
  /// This method does not return any value.
  Future<void> logout();
}
