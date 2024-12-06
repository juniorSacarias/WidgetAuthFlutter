import 'package:coffe_menu/features/appClient/data/datasource/appclient_datasource.dart';
import 'package:coffe_menu/features/appClient/domain/entities/appclient_entities.dart';
import 'package:coffe_menu/features/appClient/domain/repositories/appclient_respositories.dart';

class AppcientRespositoryImpl implements AppclientRespositories {
  final AppclientDatasource appclientDatasource;

  AppcientRespositoryImpl(this.appclientDatasource);

  @override
  Future<List<AppclientEntities>> fetchAppClient() async {
    final models = await appclientDatasource.fetchAppClient();
    return models;
  }

  @override
  Future<AppclientEntities> fetchAppClientName({
    required String appTitle,
  }) async {
    final models =
        await appclientDatasource.fetchAppClientName(appTitle: appTitle);
    return models;
  }
}
