import 'package:coffe_menu/features/auth/domain/repositories/auth_repositories.dart';
import 'package:coffe_menu/features/auth/domain/entities/auth_entities.dart';

/// A use case class for handling user login.
///
/// This class interacts with the [AuthRepositories] to perform the login
/// operation.
///
/// The [LoginUseCase] class requires an instance of [AuthRepositories] to
/// be passed to its constructor.
///
/// Methods:
/// - `Future<AuthEntities> execute(String userName, String password)`: 
///   Executes the login process with the provided [userName] and [password].
///   Throws an [Exception] if either the [userName] or [password] is empty.
class LoginUseCase {
  final AuthRepositories authRepositories;

  LoginUseCase(this.authRepositories);

  Future<AuthEntities> execute(
    String userName,
    String password,
  ) {
    if (userName.isEmpty || password.isEmpty) {
      throw Exception('Username or password is empty');
    }
    return authRepositories.login(userName, password);
  }
}
