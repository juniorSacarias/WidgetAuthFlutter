
import 'package:coffe_menu/cores/error/failure.dart';
import 'package:coffe_menu/features/appClient/domain/entities/appclient_entities.dart';
import 'package:coffe_menu/features/appClient/domain/repositories/appclient_respositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class AppclientnameUsecases {
  final AppclientRespositories _appclientRespositories;

  AppclientnameUsecases(this._appclientRespositories);

  Future<Either<Failure, AppclientEntities>> call({
    required String appTitle,
  }) async {
    try {
      final appClientName = await _appclientRespositories.fetchAppClientName(
        appTitle: appTitle,
      );
      return Right(appClientName);
    } catch (e) {
      debugPrint(e as String);
      return const Left(UnknownFailure('error'));
    }
  }
}