part of 'auth_bloc.dart';

/// Represents the different states of authentication in the application.
/// 
/// The [AuthState] class is an abstract class that extends [Equatable] to 
/// provide value equality for its subclasses. The subclasses represent 
/// various states of authentication:
/// 
/// - [AuthInitial]: The initial state before any authentication action has 
///   taken place.
/// - [AuthLoading]: The state when an authentication process is in progress.
/// - [AuthAuthenticated]: The state when a user is successfully authenticated. 
///   Contains the authenticated user's [username].
/// - [AuthError]: The state when an authentication error occurs. Contains an 
///   error [message].
/// - [AuthLoggedOut]: The state when a user has logged out.
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String username;

  const AuthAuthenticated(this.username);

  @override
  List<Object> get props => [username];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}

class AuthLoggedOut extends AuthState {}