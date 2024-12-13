import 'package:coffe_menu/features/ahamatic_login/domain/entities/ahamatic_login_entities.dart';

class AhamaticLoginModel extends AhamaticLoginEntities {
  const AhamaticLoginModel({
    super.apiKey,
    super.emailAddress,
    super.password,
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

  factory AhamaticLoginModel.fromJson(Map<String, dynamic> json) {
    return AhamaticLoginModel(
      apiKey: json['apiKey'],
      emailAddress: json['emailAddress'],
      password: json['password'],
      captchToken: json['captchToken'],
      remenberMe: json['remenberMe'],
      otherData: json['otherData'] != null
          ? List<String>.from(json['otherData'])
          : null,
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
