// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chitgoja/features/domain/repositories/firebase_repository.dart';

class GetCurrentUserIdUseCase {
  final FirebaseRepository repository;
  GetCurrentUserIdUseCase({
    required this.repository,
  });

  Future<String> getCurrrentUserId() async {
    return  repository.getCurrrentUserId();
  }
}
