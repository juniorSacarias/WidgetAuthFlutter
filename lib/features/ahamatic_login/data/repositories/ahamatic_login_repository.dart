import 'package:coffe_menu/features/ahamatic_login/data/datasource/ahamatic_login_datasource.dart';
import 'package:coffe_menu/features/ahamatic_login/data/models/ahamatic_login_models.dart';
import 'package:coffe_menu/features/ahamatic_login/domain/entities/ahamatic_login_entities.dart';
import 'package:coffe_menu/features/ahamatic_login/domain/repositories/ahamatic_login_repository.dart';

class AhamaticLoginRepositoryImpl implements AhamaticLoginRepository {
  final AhamaticLoginDatasource remoteDataSource;

  AhamaticLoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<AhamaticLoginEntities> login(
    String apiKey,
    String emailAddress,
    String password,
  ) async {
    final data = await remoteDataSource.login(apiKey, emailAddress, password);
    return AhamaticLoginModel.fromJson(
        data); // Utiliza el modelo para mapear los datos
  }
}
