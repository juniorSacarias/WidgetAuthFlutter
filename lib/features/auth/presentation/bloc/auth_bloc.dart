import 'package:coffe_menu/features/auth/domain/usecases/auth_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event_bloc.dart';
part 'auth_state_bloc.dart';

/// Bloc responsible for handling authentication events and states.
///
/// This class extends the `Bloc` class from the `flutter_bloc` package and
/// manages the authentication flow by responding to `AuthEvent` events and
/// emitting `AuthState` states.
///
/// The `AuthBloc` requires a `LoginUseCase` to be provided via its constructor.
///
/// Events handled:
/// - `LoginRequested`: Triggered when a login attempt is made.
/// - `LogoutRequested`: Triggered when a logout attempt is made.
///
/// States emitted:
/// - `AuthInitial`: Initial state of the authentication process.
/// - `AuthLoading`: State emitted when a login attempt is in progress.
/// - `AuthAuthenticated`: State emitted when a user is successfully authenticated.
/// - `AuthError`: State emitted when an error occurs during authentication.
/// - `AuthLoggedOut`: State emitted when a user is logged out.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc({required this.loginUseCase}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await loginUseCase.execute(event.username, event.password);
      emit(AuthAuthenticated(user.userName));
    } catch (e) {
      emit(AuthError("Error al iniciar sesión: ${e.toString()}"));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoggedOut());
  }
}
