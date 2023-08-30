import 'package:chitgoja/features/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:chitgoja/features/data/remote_data_source/models/user_model.dart';
import 'package:chitgoja/features/domain/entities/user_entity.dart';

import "package:firebase_auth/firebase_auth.dart";
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  FirebaseRemoteDataSourceImpl(
      {required this.firebaseFirestore,
      required this.auth,
      required this.googleSignIn});

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getCreateCurrrentUser(UserEntity user) async {
    final userCollection = await firebaseFirestore.collection('users');

    final uid = await getCurrrentUserId();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
              gender: user.gender,
              name: user.name,
              isOnline: user.isOnline,
              email: user.email,
              dob: user.dob,
              profileUrl: user.profileUrl,
              status: user.status,
              uid: user.uid)
          .toDocument();

      if (userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      }
      return;
    });
  }

  @override
  Future<void> getUpadateUser(UserEntity user) {
    // TODO: implement getUpadateUser
    throw UnimplementedError();
  }

  @override
  Future<void> googleAuth() {
    // TODO: implement googleAuth
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> isSignOut() {
    // TODO: implement isSignOut
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(UserEntity user) async {
    await auth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> signOut(UserEntity user) async {
    await auth.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    await auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<String> getCurrrentUserId() async => auth.currentUser!.uid;
}
