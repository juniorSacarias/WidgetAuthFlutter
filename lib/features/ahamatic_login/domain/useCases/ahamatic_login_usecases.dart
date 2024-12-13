import 'package:coffe_menu/features/ahamatic_login/domain/entities/ahamatic_login_entities.dart';
import 'package:coffe_menu/features/ahamatic_login/domain/repositories/ahamatic_login_repository.dart';

class AhamaticLoginUsecases {
  final AhamaticLoginRepository ahamaticLoginRepository;

  AhamaticLoginUsecases(this.ahamaticLoginRepository);

  Future<AhamaticLoginEntities> execute(
    String apiKey,
    String emailAddress,
    String password,
  ) {
    if (apiKey.isEmpty) {
      throw Exception('Api key is empty');
    }

    if (emailAddress.isEmpty || password.isEmpty) {
      throw Exception('Email address or password is empty');
    }

    return ahamaticLoginRepository.login(
      apiKey,
      emailAddress,
      password,
    );
  }
}
