// auth_bloc.dart
import 'package:coffe_menu/features/appClient/domain/entities/appClient_entities.dart';
import 'package:coffe_menu/features/appClient/domain/useCases/appClientName_useCases.dart';
import 'package:coffe_menu/features/auth/domain/usecases/auth_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event_bloc.dart';
part 'auth_state_bloc.dart';

bool isAuthenticated = false; // Variable global para el estado de autenticación

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final AppclientnameUsecases appclientnameUsecases;

  AuthBloc({
    required this.loginUseCase,
    required this.appclientnameUsecases,
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
      final user = await loginUseCase.execute(event.username, event.password);
      isAuthenticated = true; // Actualiza el estado de autenticación
      emit(AuthAuthenticated(user.userName));
    } catch (e) {
      emit(AuthError("Error al iniciar sesión: ${e.toString()}"));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    isAuthenticated = false; // Actualiza el estado de autenticación
    emit(AuthLoggedOut());
  }

  Future<void> _onFetchClientData(
    FetchClientData event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await appclientnameUsecases.call(appTitle: event.appTitle);
    result.fold(
      (failure) => emit(AuthError("Error al obtener los datos del cliente")),
      (client) => emit(ClientDataLoaded(client)),
    );
  }
}
