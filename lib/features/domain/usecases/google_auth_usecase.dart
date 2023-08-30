// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chitgoja/features/domain/repositories/firebase_repository.dart';

class GoogleAuthUseCase {
  final FirebaseRepository repository;
  GoogleAuthUseCase({
    required this.repository,
  });

  Future<void> googleAuth() {
    return repository.googleAuth();
  }
}
