import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'reset_controller.g.dart';

class ResetController = _ResetControllerBase with _$ResetController;

abstract class _ResetControllerBase with Store {
  @observable
  String emailUser;
  @action
  changeEmailUser(String value) => emailUser = value;

  @action
  Future resetPass(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailUser);
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("FOI ENVIADO AO SEU EMAIL"),
          backgroundColor: Colors.green));
    } catch (e) {
      print("Error: ${e.toString()}");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Erro ao enviar"),
        backgroundColor: Colors.redAccent,
      ));
    }
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
