import 'package:coffe_menu/features/appClient/data/datasource/appClient_datasource.dart';
import 'package:coffe_menu/features/appClient/domain/entities/appClient_entities.dart';
import 'package:coffe_menu/features/appClient/domain/repositories/appClient_respositories.dart';

class AppcientRespositoryImpl implements AppclientRespositories {
  final AppclientDatasource appclientDatasource;

  AppcientRespositoryImpl(this.appclientDatasource);

  @override
  Future<List<AppclientEntities>> fetchAppClient() async {
    final models = await appclientDatasource.fetchAppClient();
    return models;
  }

  Future<AppclientEntities> fetchAppClientName({
    required String appTitle,
  }) async {
    final models =
        await appclientDatasource.fetchAppClientName(appTitle: appTitle);
    return models;
  }
}
