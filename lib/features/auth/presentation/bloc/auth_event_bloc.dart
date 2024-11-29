part of 'auth_bloc.dart';

/// Abstract class representing authentication events.
/// 
/// This class extends [Equatable] to allow for value comparison of events.
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// Event triggered when a login is requested.
/// 
/// Contains the [username] and [password] required for login.
class LoginRequested extends AuthEvent {
  final String username;
  final String password;

  const LoginRequested(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

/// Event triggered when a logout is requested.
class LogoutRequested extends AuthEvent {}
