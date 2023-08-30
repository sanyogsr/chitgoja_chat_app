// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? isOnline;
  final String? uid;
  final String? status;
  final String? profileUrl;
  final String? password;
  final String? dob;
  final String? gender;
  UserEntity({
    this.name,
    this.email,
    this.phoneNumber,
    this.isOnline,
    this.uid,
    this.status,
    this.profileUrl,
    this.password,
    this.dob,
    this.gender,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        phoneNumber,
        isOnline,
        uid,
        status,
        name,
        profileUrl,
        password,
        dob,
        gender,
      ];
}
