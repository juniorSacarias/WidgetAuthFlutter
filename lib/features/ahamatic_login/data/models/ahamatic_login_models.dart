import 'package:coffe_menu/features/ahamatic_login/domain/entities/ahamatic_login_entities.dart';

class AhamaticLoginModels extends AhamaticLoginEntities {
  const AhamaticLoginModels({
    required super.apiKey,
    required super.emailAddress,
    required super.password,
    super.captchToken,
    super.remenberMe,
    super.otherData,
    super.message,
    super.token,
    super.refreshToken,
    super.account,
    super.applicationId,
    super.application,
    super.ahamaticTokenExpiration,
  });

  factory AhamaticLoginModels.fromJson(Map<String, dynamic> json) {
    return AhamaticLoginModels(
      apiKey: json['apiKey'],
      emailAddress: json['emailAddress'],
      password: json['password'],
      captchToken: json['captchToken'],
      remenberMe: json['remenberMe'],
      otherData: json['otherData'],
      message: json['message'],
      token: json['token'],
      refreshToken: json['refreshToken'],
      account: json['account'],
      applicationId: json['applicationId'],
      application: json['application'],
      ahamaticTokenExpiration: json['ahamaticTokenExpiration'],
    );
  }
}

