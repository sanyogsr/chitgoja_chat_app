// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chitgoja/features/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

import 'package:chitgoja/features/domain/usecases/forgot_password_usecase.dart';
import 'package:chitgoja/features/domain/usecases/get_create_current_user_usecase.dart';
import 'package:chitgoja/features/domain/usecases/google_auth_usecase.dart';
import 'package:chitgoja/features/domain/usecases/sign_in_usecase.dart';
import 'package:chitgoja/features/domain/usecases/sign_up_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GoogleAuthUseCase googleAuthUseCase;
  final SignUpUseCase signUpUseCase;

  CredentialCubit({
    required this.signInUseCase,
    required this.forgotPasswordUseCase,
    required this.getCreateCurrentUserUseCase,
    required this.googleAuthUseCase,
    required this.signUpUseCase,
  }) : super(CredentialInitial());

  Future<void> submitSignUp({required UserEntity user}) async {
    try {
      await signUpUseCase.signUp(user);
      await getCreateCurrentUserUseCase.getCreateCurrrentUser(user);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitSignIn({required UserEntity user}) async {
    try {
      await signInUseCase.signin(user);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitGoogleAuth({required UserEntity user}) async {
    try {
      await googleAuthUseCase.googleAuth();
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> SubmitForgotPassword({required UserEntity user}) async {
    try {
      await forgotPasswordUseCase.forgotPassword(user.email!);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
