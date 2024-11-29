import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Abstract class representing the data source for authentication.
abstract class AuthDatasource {
  /// Logs in a user by their [userName] and [password].
  ///
  /// Returns a [Future] containing a [Map<String, dynamic>] with the authentication data.
  /// Throws an exception if authentication fails.
  Future<Map<String, dynamic>> login(String userName, String password);
}

/// Implementation of the [AuthDatasource] that interacts with a remote server.
class AuthRemoteDataSourceImpl implements AuthDatasource {
  /// Instance of Dio for making HTTP requests.
  final Dio _dio;

  /// Constructs an instance of [AuthRemoteDataSourceImpl].
  ///
  /// Requires a [Dio] instance to handle HTTP communication.
  AuthRemoteDataSourceImpl(this._dio);

  /// Logs in a user by sending a POST request to the authentication endpoint.
  ///
  /// - [userName]: The username of the user trying to log in.
  /// - [password]: The password of the user.
  ///
  /// Returns:
  /// A [Future] containing a [Map<String, dynamic>] with the server's response data
  /// if the login is successful.
  ///
  /// Throws:
  /// - [Exception]: If the server responds with an error or if there is a failure during the request.
  @override
  Future<Map<String, dynamic>> login(String userName, String password) async {
    try {
      // Get the base URL and endpoint from environment variables.
      final String apiBaseUrl = dotenv.get('BASE_URL');
      final String endPoint = dotenv.get('ENDPOINT');

      // Construct the full URL for the login request.
      final String url = '$apiBaseUrl$endPoint';

      // Send the POST request with the username and password as data.
      final Response response = await _dio.post(
        url,
        data: {'username': userName, 'password': password},
      );

      // Check if the response status code indicates success.
      if (response.statusCode == 200) {
        // Return the response data if authentication is successful.
        return response.data;
      } else {
        // Throw an exception if the authentication fails.
        throw Exception("Authentication error");
      }
    } catch (e) {
      // Catch and rethrow any exceptions that occur during the process.
      throw Exception("Error authenticating: $e");
    }
  }
}
