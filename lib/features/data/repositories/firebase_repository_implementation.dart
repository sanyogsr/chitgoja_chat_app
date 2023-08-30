import 'package:chitgoja/features/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:chitgoja/features/domain/entities/user_entity.dart';
import 'package:chitgoja/features/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImplementation implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImplementation({required this.remoteDataSource});

  @override
  Future<void> forgotPassword(String email) =>
      remoteDataSource.forgotPassword(email);

  @override
  Future<void> getCreateCurrrentUser(UserEntity user) =>
      remoteDataSource.getCreateCurrrentUser(user);

  @override
  Future<String> getCurrrentUserId() => remoteDataSource.getCurrrentUserId();

  @override
  Future<void> getUpadateUser(UserEntity user) =>
      remoteDataSource.getUpadateUser(user);

  @override
  Future<void> googleAuth() => remoteDataSource.googleAuth();

  @override
  Future<bool> isSignIn() => remoteDataSource.isSignIn();

  @override
  Future<void> isSignOut() => remoteDataSource.isSignOut();

  @override
  Future<void> signIn(UserEntity user) => remoteDataSource.signIn(user);

  @override
  Future<void> signOut(UserEntity user) => remoteDataSource.signOut(user);

  @override
  Future<void> signUp(UserEntity user) => remoteDataSource.signUp(user);
}
