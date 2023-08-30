import 'package:chitgoja/features/domain/repositories/firebase_repository.dart';

class IsSignOutUseCase {
  final FirebaseRepository repository;
  IsSignOutUseCase({
    required this.repository,
  });

  Future<void> isSignOut() {
    return repository.isSignOut();
  }
}
