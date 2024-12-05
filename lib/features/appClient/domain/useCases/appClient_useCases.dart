import 'package:coffe_menu/cores/error/failure.dart';
import 'package:coffe_menu/features/appClient/domain/entities/appClient_entities.dart';
import 'package:coffe_menu/features/appClient/domain/repositories/appClient_respositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class AppclientUsecases {
  final AppclientRespositories _appclientRespositories;

  AppclientUsecases(this._appclientRespositories);

  Future<Either<Failure, List<AppclientEntities>>> call() async {
    try {
      final appClient = await _appclientRespositories.fetchAppClient();
      return Right(appClient);
    } catch (e) {
      debugPrint(e as String);
      return const Left(UnknownFailure('error'));
    }
  }
}
