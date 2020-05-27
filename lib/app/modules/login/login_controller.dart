import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:string_validator/string_validator.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get();

  @observable
  bool loading = false;

  @observable
  String usuario = '';
  @action
  changeEmail(String value) => usuario = value;

  @observable
  String senha = '';
  @action
  changeSenha(String value) => senha = value;

  String validateEmail() {
    if (isEmail(this.usuario) == false) {
      return "Utilize um e-mail valido";
    }
    return null;
  }

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await auth.loginWithGoogle();
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      loading = false;
    }
  }

  @action
  Future loginWithEmail(context) async {
    FirebaseUser user =
        await auth.loginWithEmail(context, this.usuario, this.senha);
  }
}
