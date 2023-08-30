// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chitgoja/features/domain/repositories/firebase_repository.dart';

class IsSignInUseCase {
  final FirebaseRepository repository;
  IsSignInUseCase({
    required this.repository,
  });
  Future<bool> isSignIn() {
    return repository.isSignIn();
  }
}
