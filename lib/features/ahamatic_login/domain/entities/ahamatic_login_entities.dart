import 'package:equatable/equatable.dart';

class AhamaticLoginEntities extends Equatable {
  final String? apiKey;
  final String? emailAddress;
  final String? password;
  final String? captchToken;
  final bool? remenberMe;
  final List<String>? otherData;
  final String? message;
  final String? token;
  final String? refreshToken;
  final Object? account;
  final String? applicationId;
  final String? application;
  final int? ahamaticTokenExpiration;

  const AhamaticLoginEntities({
    this.apiKey,
    this.emailAddress,
    this.password,
    this.captchToken,
    this.remenberMe,
    this.otherData,
    this.message,
    this.token,
    this.refreshToken,
    this.account,
    this.applicationId,
    this.application,
    this.ahamaticTokenExpiration,
  });

  @override
  List<Object?> get props => [
        apiKey,
        emailAddress,
        password,
        captchToken,
        remenberMe,
        otherData,
        message,
        token,
        refreshToken,
        account,
        applicationId,
        application,
        ahamaticTokenExpiration,
        otherData,
      ];
}
