// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chitgoja/features/domain/usecases/get_current_user_id_usecase.dart';
import 'package:equatable/equatable.dart';

import 'package:chitgoja/features/domain/usecases/get_create_current_user_usecase.dart';
import 'package:chitgoja/features/domain/usecases/is_signin_usecase.dart';
import 'package:chitgoja/features/domain/usecases/is_signout_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUserIdUseCase getCurrentUserIdUseCase;
  final IsSignOutUseCase isSignOutUseCase;
  AuthCubit({
    required this.isSignInUseCase,
    required this.getCurrentUserIdUseCase,
    required this.isSignOutUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignin = await isSignInUseCase.isSignIn();

      if (isSignin) {
        final uid = await getCurrentUserIdUseCase.getCurrrentUserId();
        emit(AuthenticatedState(uid: uid));
      } else {
        emit(UnAuthenticatedState());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  Future<void> loggedIn() async {
    try {
      isSignInUseCase.isSignIn();
      final uid = await getCurrentUserIdUseCase.getCurrrentUserId();
      emit(AuthenticatedState(uid: uid));
    } catch (_) {
      emit(UnAuthenticatedState());
    }

    Future<void> loggedOut() async {
      try {
        isSignOutUseCase.isSignOut();
        emit(UnAuthenticatedState());
      } catch (_) {
        emit(UnAuthenticatedState());
      }
    }
  }
}
