import 'dart:convert';

import 'package:coffe_menu/features/appClient/data/models/appclient_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppclientDatasource {
  Future<List<AppclientModels>> fetchAppClient();
  Future<AppclientModels> fetchAppClientName({
    required String appTitle,
  });
}

class AppclientDatasourceImpl implements AppclientDatasource {
  final Dio _dio;

  AppclientDatasourceImpl(this._dio);

  @override
  Future<List<AppclientModels>> fetchAppClient() async {
    try {
      final String apiBaseUrl = dotenv.get('BASE_URL');
      final String apiEndPoint = dotenv.get('ENDPOINTCLIENT');
      final Response<String> response = await _dio.get<String>(
        '$apiBaseUrl$apiEndPoint',
      );
      if (response.data == null) throw Exception('Can not find the client');
      final List<AppclientModels> appClient = parseAppClient(response.data!);
      return appClient;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<AppclientModels> fetchAppClientName({
    required String appTitle,
  }) async {
    try {
      final String apiBaseUrl = dotenv.get('BASE_URL');
      final String apiEndPoint = dotenv.get('ENDPOINTCLIENT');
      final Response<String> response = await _dio.get<String>(
        '$apiBaseUrl$apiEndPoint/$appTitle',
      );
      if (response.data == null) throw Exception('Can not find the client');
      final Map<String, dynamic> json = jsonDecode(response.data!);
      final appClient = AppclientModels.fromJson(json);
      return appClient;
    } catch (e) {
      return const AppclientModels(
        id: 0,
        appTitle: '',
        imageLink: '',
      );
    }
  }

  List<AppclientModels> parseAppClient(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<AppclientModels>((json) => AppclientModels.fromJson(json))
        .toList();
  }
}
