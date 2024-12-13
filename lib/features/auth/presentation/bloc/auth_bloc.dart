// auth_bloc.dart
import 'package:coffe_menu/features/ahamatic_login/domain/useCases/ahamatic_login_usecases.dart';
import 'package:coffe_menu/features/appClient/domain/entities/appclient_entities.dart';
import 'package:coffe_menu/features/appClient/domain/useCases/appclientname_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event_bloc.dart';
part 'auth_state_bloc.dart';

bool isAuthenticated = false; // Variable global para el estado de autenticación

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppclientnameUsecases appclientnameUsecases;
  final AhamaticLoginUsecases ahamaticLoginUsecases;

  AuthBloc({
    required this.appclientnameUsecases,
    required this.ahamaticLoginUsecases,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<FetchClientData>(_onFetchClientData);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await ahamaticLoginUsecases.execute(
        event.apiKey,
        event.username,
        event.password,
      );
      isAuthenticated = true;
      emit(AuthAuthenticated(user.token ?? ''));
    } catch (e) {
      emit(AuthError("Error al iniciar sesión: ${e.toString()}"));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    isAuthenticated = false; 
    emit(AuthLoggedOut());
  }

  Future<void> _onFetchClientData(
    FetchClientData event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await appclientnameUsecases.call(appTitle: event.appTitle);
    result.fold(
      (failure) =>
          emit(const AuthError("Error al obtener los datos del cliente")),
      (client) => emit(ClientDataLoaded(client)),
    );
  }
}

