// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/models/usermodel.dart';
import 'package:flutter_application_3/services/database.dart';
// import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  customuser? _userFromfb(User? user) {
    return user != null ? customuser(uid: user.uid) : null;
  }

  Stream<customuser?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromfb(user));
  }

  Future SignInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromfb(user);
    } catch (error) {
      print(error as String);
      return null;
    }
  }

  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error as String);
      return null;
    }
  }

  Future emailregistration(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      DataBaseService(uid: user!.uid).updateUserData('0', "new member", 100);
      return _userFromfb(user);
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future emailsignIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFromfb(user);
    } catch (error) {
      print(error);
      return null;
    }
  }
}
