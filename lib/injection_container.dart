import 'package:chitgoja/features/data/remote_data_source/firebase_remote_data%7B_source_impl.dart';
import 'package:chitgoja/features/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:chitgoja/features/data/repositories/firebase_repository_implementation.dart';
import 'package:chitgoja/features/domain/repositories/firebase_repository.dart';
import 'package:chitgoja/features/domain/usecases/forgot_password_usecase.dart';
import 'package:chitgoja/features/domain/usecases/get_create_current_user_usecase.dart';
import 'package:chitgoja/features/domain/usecases/get_current_user_id_usecase.dart';
import 'package:chitgoja/features/domain/usecases/google_auth_usecase.dart';
import 'package:chitgoja/features/domain/usecases/is_signin_usecase.dart';
import 'package:chitgoja/features/domain/usecases/is_signout_usecase.dart';
import 'package:chitgoja/features/domain/usecases/sign_in_usecase.dart';
import 'package:chitgoja/features/domain/usecases/sign_up_usecase.dart';
import 'package:chitgoja/features/presentation/cubits/auth/cubit/auth_cubit.dart';
import 'package:chitgoja/features/presentation/cubits/credentials/cubit/credential_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl.call(),
      getCurrentUserIdUseCase: sl.call(),
      isSignOutUseCase: sl.call()));

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
      signInUseCase: sl.call(),
      forgotPasswordUseCase: sl.call(),
      getCreateCurrentUserUseCase: sl.call(),
      googleAuthUseCase: sl.call(),
      signUpUseCase: sl.call()));

  //usecases
//auth cubit usecases
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignOutUseCase>(
      () => IsSignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUserIdUseCase>(
      () => GetCurrentUserIdUseCase(repository: sl.call()));

  //credential cubit usecases
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GoogleAuthUseCase>(
      () => GoogleAuthUseCase(repository: sl.call()));

  //repository

  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImplementation(remoteDataSource: sl.call()));

  //remote
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(
          firebaseFirestore: sl.call(),
          auth: sl.call(),
          googleSignIn: sl.call()));

  // local

  //external

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => googleSignIn);
}
