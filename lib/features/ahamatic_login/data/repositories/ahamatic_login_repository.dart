import 'package:coffe_menu/features/ahamatic_login/data/datasource/ahamatic_login_datasource.dart';
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
    return AhamaticLoginEntities(
      message: data['message'],
      token: data['token'],
      refreshToken: data['refreshToken'],
      account: data['account'],
      applicationId: data['applicationId'],
      application: data['application'],
      ahamaticTokenExpiration: data['ahamaticTokenExpiration'],
      otherData: data['otherData'],
    );
  }
}
