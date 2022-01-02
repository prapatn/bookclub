// ignore_for_file: file_names

import 'package:bookclub_application/models/users.dart';
import 'package:bookclub_application/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUser extends ChangeNotifier {
  OurUser? _currentUser = OurUser();
  OurUser? get getCurrentUser => _currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retVal = "error";
    try {
      User? _firebaseUser =  await _auth.currentUser;
      if (_firebaseUser != null) {
        _currentUser = await OurDatabase().getUserInfo(_firebaseUser.uid);
      if (_currentUser != null) {
        retVal = "success";
      }

      }
    } catch (e) {
      retVal = e.toString();
      print(e);
    }

    return retVal;
  }

  Future<String> signOut() async {
    String retVal = "error";
    try {
      await _auth.signOut();
      _currentUser = OurUser();
      retVal = "success";
    } catch (e) {
      retVal = e.toString();
      print(e);
    }

    return retVal;
  }

  Future<String> signUpUser(
      String email, String password, String fullName) async {
    String retVal = "error";
    OurUser _user = OurUser();
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _user.uid = _authResult.user!.uid;
      _user.email = _authResult.user!.email;
      _user.fullName = fullName;
      String _returnStr = await OurDatabase().createUser(_user);
      if (_returnStr == "success") {
        retVal = "success";
      }
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }

  Future<String> loginUserWithGoogle() async {
    String retVal = "error";

    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);

    OurUser _user = OurUser();

    try {
      GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth =
          await _googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      UserCredential _authResult = await _auth.signInWithCredential(credential);

      if (_authResult.additionalUserInfo!.isNewUser) {
        _user.uid = _authResult.user!.uid;
        _user.email = _authResult.user!.email;
        _user.fullName = _authResult.user!.displayName;
        OurDatabase().createUser(_user);
      }

      _currentUser = await OurDatabase().getUserInfo(_authResult.user!.uid);
      if (_currentUser != null) {
        retVal = "success";
      }
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "error";

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

    _currentUser = await OurDatabase().getUserInfo(_authResult.user!.uid);
      if (_currentUser != null) {
        retVal = "success";
      }

    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }
}
