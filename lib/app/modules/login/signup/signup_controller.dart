import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:string_validator/string_validator.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  bool isLoading;

  @observable
  String name;
  @action
  changeName(String value) => name = value;

  @observable
  String email = '';
  @action
  changeEmail(String value) => email = value;

  @observable
  String pass = '';
  @action
  changePass(String value) => pass = value;

  @observable
  String pass2 = '';
  @action
  changePass2(String value) => pass2 = value;

  @computed
  bool get validateButtom {
    return validateName() == null &&
        validateEmail() == null &&
        validatePass() == null;
  }

  // funções de validação

  String validateName() {
    if (this.name == null || this.name.isEmpty) {
      return "Este campo é obrigatório";
    } else if (isNumeric(this.name) == true) {
      return "Digite um nome valido";
    }

    return null;
  }

  String validateEmail() {
    if (isEmail(this.email) == false) {
      return "Utilize um e-mail valido";
    }

    return null;
  }

  String validatePass() {
    if (pass.isEmpty && pass2.isEmpty) {
      return "";
    } else if (pass2 != pass) return "As senhas são diferentes";

    return null;
  }

  // Funções de Cadastro Firebase

  FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic> userData = Map();
  AuthResult firebaseAuth;
  Firestore db = Firestore.instance;

  void signUp() {
    userData = {
      "name": name,
      "email": email,
    };

    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((user) async {
      firebaseAuth = user;

      await _saveUserData();
    }).catchError((e) {});
  }

  Future<void> _saveUserData() async {
    await db
        .collection("users")
        .document(firebaseAuth.user.uid)
        .setData({'name': name, 'email': email, 'id': firebaseAuth.user.uid});
  }
}
