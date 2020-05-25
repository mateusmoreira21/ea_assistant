import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> getUser();
  Future getEmailPasswordLogin(String usuario, String senha);
  Future<FirebaseUser> getGoogleLogin();
  Future getLogout();
  Future<String> getToken();
}
