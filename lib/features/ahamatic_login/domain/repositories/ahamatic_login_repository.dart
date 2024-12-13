import 'package:coffe_menu/features/ahamatic_login/domain/entities/ahamatic_login_entities.dart';

abstract class AhamaticLoginRepository {
  Future<AhamaticLoginEntities> login(
    String apiKey,
    String emailAddress,
    String password,
  );
}
