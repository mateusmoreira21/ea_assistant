import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> getUser();
  Future getEmailPasswordLogin(
      BuildContext context, String usuario, String senha);
  Future<FirebaseUser> getGoogleLogin();
  Future getLogout();
  Future<String> getToken();
}
