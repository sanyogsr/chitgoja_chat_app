// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chitgoja/features/domain/entities/user_entity.dart';
import 'package:chitgoja/features/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository repository;
  GetCreateCurrentUserUseCase({
    required this.repository,
  });

  Future<void> getCreateCurrrentUser(UserEntity entity) {
    return getCreateCurrrentUser(entity);
  }
}
