import 'package:coffe_menu/features/appClient/domain/entities/appClient_entities.dart';

abstract class AppclientRespositories {
  Future<List<AppclientEntities>> fetchAppClient();
  Future<AppclientEntities> fetchAppClientName({
    required String appTitle,
  });
}
