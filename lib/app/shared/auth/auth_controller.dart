import 'package:ea_assistant/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  FirebaseUser user;

  @observable
  AuthStatus status = AuthStatus.loading;

  @action
  setUser(FirebaseUser value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
  }

  getUser() {
    return user.uid;
  }

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }

  @action
  Future loginWithEmail(
      BuildContext context, String usuario, String senha) async {
    user = await _authRepository.getEmailPasswordLogin(context, usuario, senha);
  }

  @action
  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
  }

  Future logOut() {
    return _authRepository.getLogout();
  }
}

enum AuthStatus { loading, login, logoff }
