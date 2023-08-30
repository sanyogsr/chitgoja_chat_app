import 'package:chitgoja/features/domain/entities/user_entity.dart';

abstract class FirebaseRemoteDataSource {
  //credential section
  Future<void> signIn(UserEntity user);
  Future<void> signOut(UserEntity user);
  Future<bool> isSignIn();
  Future<void> isSignOut();
  Future<void> forgotPassword(String email);
  Future<void> googleAuth();
  Future<void> getUpadateUser(UserEntity user);
  Future<void> getCreateCurrrentUser(UserEntity user);
  Future<String> getCurrrentUserId();
  Future<void> signUp(UserEntity userEntity);

  //Fixme: missing overrides
}
