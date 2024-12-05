import 'package:coffe_menu/features/appClient/data/datasource/appClient_datasource.dart';
import 'package:coffe_menu/features/appClient/data/repositories/appCient_respository_impl.dart';
import 'package:coffe_menu/features/appClient/domain/repositories/appClient_respositories.dart';
import 'package:coffe_menu/features/appClient/domain/useCases/appClientName_useCases.dart';
import 'package:coffe_menu/features/appClient/domain/useCases/appClient_useCases.dart';
import 'package:coffe_menu/features/auth/data/datasource/auth_datasource.dart';
import 'package:coffe_menu/features/auth/data/repositories/auth_repository.dart';
import 'package:coffe_menu/features/auth/domain/repositories/auth_repositories.dart';
import 'package:coffe_menu/features/auth/domain/usecases/auth_usecases.dart';
import 'package:coffe_menu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

part 'injection_container.main.dart';