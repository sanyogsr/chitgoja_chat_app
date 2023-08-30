import 'package:chitgoja/features/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  //credential section
  Future<void> signIn(UserEntity user);
  Future<void> signOut(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<bool> isSignIn();
  Future<void> isSignOut();
  Future<void> forgotPassword(String email);
  Future<void> googleAuth();
  Future<void> getUpadateUser(UserEntity user);
  Future<void> getCreateCurrrentUser(UserEntity user);
  Future<String> getCurrrentUserId();

  //Fixme: missing overrides
}
