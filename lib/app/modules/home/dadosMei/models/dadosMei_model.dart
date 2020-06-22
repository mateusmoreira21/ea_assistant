import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DadosMeiModel {
  final auth = Modular.get<AuthController>();

  String nomeFantasia;
  String email;
  String name;
  String cnpj;
  String id;
  String descricao;
  String telefone;
  DocumentReference reference;

  DadosMeiModel({
    this.reference,
    this.nomeFantasia = '',
    this.name = '',
    this.email = '',
    this.cnpj = '',
    this.id = '',
    this.descricao = '',
    this.telefone = '',
  });

  factory DadosMeiModel.fromDocument(DocumentSnapshot doc) {
    return DadosMeiModel(
      reference: doc.reference,
      name: doc['name'],
      nomeFantasia: doc['nome fantasia'],
      email: doc['email'],
      cnpj: doc['cnpj'],
      id: doc['id'],
      telefone: doc['telefone'],
      descricao: doc['descricao'],
    );
  }

  Future save() async {
    if (reference == null) {
      Firestore.instance.collection('users').add({
        'name': name,
        'nome fantasia': nomeFantasia,
        'cnpj': cnpj,
        'email': email,
        'telefone': telefone,
        'id': auth.user.uid,
        'descricao': descricao,
      });
    } else {
      reference.updateData({
        'name': name,
        'nome fantasia': nomeFantasia,
        'cnpj': cnpj,
        'email': email,
        'telefone': telefone,
        'id': auth.user.uid,
        'descricao': descricao,
      });
    }
  }
}
