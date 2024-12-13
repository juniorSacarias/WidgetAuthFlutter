import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AhamaticLoginDatasource {
  Future<Map<String, dynamic>> login(
    String apiKey,
    String emailAddress,
    String password,
  );
}

class AhamaticLoginDatasourceImpl implements AhamaticLoginDatasource {
  final Dio _dio;

  AhamaticLoginDatasourceImpl(this._dio);

  @override
  Future<Map<String, dynamic>> login(
    String apiKey,
    String emailAddress,
    String password,
  ) async {
    try {
      final String apiBaseUrl = dotenv.get('BASE_URL_AHAMATIC');
      final String endPoint = dotenv.get('ENDPOINT_AHAMATIC');
      final String url = '$apiBaseUrl$endPoint';

      final Response response = await _dio.post(
        url,
        data: {
          'apiKey': apiKey,
          'emailAddress': emailAddress,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Authentication error");
      }
    } catch (e) {
      throw Exception("Error authenticating: $e");
    }
  }
}
