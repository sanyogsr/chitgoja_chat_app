import 'package:chitgoja/features/domain/entities/user_entity.dart';
import 'package:chitgoja/features/domain/repositories/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<void> signin(UserEntity user) {
    return repository.signIn(user);
  }
}
