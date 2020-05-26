import 'package:ea_assistant/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<AuthResult> getEmailPasswordLogin(
      BuildContext context, String usuario, String senha) async {
    try {
      AuthResult user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: usuario, password: senha);
      if (user != null) {
        Modular.to.pushReplacementNamed('/home');
      }
      print('logado em ${user.user.uid}');
    } catch (e) {
      print("Error: ${e.toString()}");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Falha ao realizar o login"),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  Future<FirebaseUser> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Future<String> getToken() {
    return null;
  }

  @override
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  @override
  Future getLogout() {
    return _auth.signOut();
  }
}
