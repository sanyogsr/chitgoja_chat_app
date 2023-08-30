part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthenticatedState extends AuthState {
  final String uid;

  AuthenticatedState({required this.uid});
  @override
  List<Object> get props => [uid];
}

final class UnAuthenticatedState extends AuthState {
  
  @override
  List<Object> get props => [];
}
