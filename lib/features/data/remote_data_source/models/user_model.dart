import 'package:chitgoja/features/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  UserModel({
    final String? name,
    final String? email,
    final String? phoneNumber,
    final String? isOnline,
    final String? uid,
    final String? status,
    final String? profileUrl,
    final String? password,
    final String? dob,
    final String? gender,
  }) : super(
            uid: uid,
            name: name,
            email: email,
            isOnline: isOnline,
            status: status,
            profileUrl: profileUrl,
            password: password,
            dob: dob,
            gender: gender,
            phoneNumber: phoneNumber);

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
        status: snapshot.get('status'),
        uid: snapshot.get('uid'),
        name: snapshot.get('name'),
        profileUrl: snapshot.get('profileUrl'),
        dob: snapshot.get('dob'),
        gender: snapshot.get('gender'),
        phoneNumber: snapshot.get('phoneNumber'),
        email: snapshot.get('email'),
        isOnline: snapshot.get('isOnline'),
        password: snapshot.get('password'));
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "dob": dob,
      "email ": email,
      "gender": gender,
      "isOnline": isOnline,
      "name": name,
      "phoneNumber": phoneNumber,
      "status": status,
      "profileUrl": profileUrl
    };
  }
}
   
   