// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chitgoja/features/domain/entities/user_entity.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:chitgoja/features/domain/repositories/firebase_repository.dart';

class GetUpadateUserUseCase {
  final FirebaseRepository repository;
  GetUpadateUserUseCase({
    required this.repository,
  });

  Future<void> getUpadateUser(UserEntity user) {
    return repository.getUpadateUser(user);
  }
}
