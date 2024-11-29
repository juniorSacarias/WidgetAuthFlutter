import 'package:coffe_menu/features/auth/data/datasource/auth_datasource.dart';
import 'package:coffe_menu/features/auth/domain/entities/auth_entities.dart';
import 'package:coffe_menu/features/auth/domain/repositories/auth_repositories.dart';

/// Implementation of the [AuthRepositories] interface.
/// 
/// This class is responsible for handling authentication-related operations
/// such as login and logout by interacting with the remote data source.
class AuthRepositoryImpl implements AuthRepositories {
  /// The remote data source for authentication operations.
  final AuthDatasource remoteDataSource;

  /// Creates an instance of [AuthRepositoryImpl] with the given [remoteDataSource].
  AuthRepositoryImpl(this.remoteDataSource);

  /// Logs in a user with the provided [username] and [password].
  ///
  /// Returns an [AuthEntities] object containing the authentication token and username.
  ///
  /// Throws an exception if the login fails.
  @override
  Future<AuthEntities> login(String username, String password) async {
    final data = await remoteDataSource.login(username, password);
    return AuthEntities(
      token: data['token'],
      userName: data['username'],
    );
  }

  /// Logs out the current user.
  ///
  /// This method currently does not perform any operations.
  @override
  Future<void> logout() async {
  }
}
