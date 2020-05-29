import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FornecedorModel {
  final auth = Modular.get<AuthController>();

  String nomeFantasia;
  String razaoSocial;
  String cnpj;
  String logradouro;
  String numero;
  String id;
  String cep;
  String cidade;
  String estado;
  String bairro;
  String complemento = 'S/C';
  DocumentReference reference;

  FornecedorModel(
      {this.reference,
      this.nomeFantasia = '',
      this.razaoSocial = '',
      this.cnpj = '',
      this.id = '',
      this.cep = '',
      this.estado = '',
      this.cidade = '',
      this.bairro = '',
      this.logradouro = '',
      this.numero = '',
      this.complemento});

  factory FornecedorModel.fromDocument(DocumentSnapshot doc) {
    return FornecedorModel(
        reference: doc.reference,
        razaoSocial: doc['razao social'],
        nomeFantasia: doc['nome fantasia'],
        cnpj: doc['cnpj'],
        id: doc['id'],
        cep: doc['cep'],
        estado: doc['UF'],
        cidade: doc['cidade'],
        bairro: doc['bairro'],
        logradouro: doc['logradouro'],
        numero: doc['numero'],
        complemento: doc['complemento']);
  }

  // Map<String, dynamic> getMap() {
  //   var map = new Map<String, dynamic>();
  //   map['razao social'] = this.razaoSocial;
  //   map['nome fantasia'] = this.nomeFantasia;
  //   map['cnpj'] = this.cnpj;
  //   map['id'] = id;
  //   map['cep'] = cep;
  //   map['UF'] = estado;
  //   map['cidade'] = cidade;
  //   map['bairro'] = bairro;
  //   map['logradouro'] = logradouro;
  //   map['numero'] = numero;
  //   map['complemento'] = complemento;

  //   return map;
  // }

  Future save() async {
    if (reference == null) {
      Firestore.instance.collection('fornecedores').add({
        'razao social': razaoSocial,
        'nome fantasia': nomeFantasia,
        'cnpj': cnpj,
        'id': auth.user.uid,
        'cep': cep,
        'UF': estado,
        'cidade': cidade,
        'bairro': bairro,
        'logradouro': logradouro,
        'numero': numero,
        'complemento': complemento
      });
    } else {
      reference.updateData({
        'razao social': razaoSocial,
        'nome fantasia': nomeFantasia,
        'cnpj': cnpj,
        'id': id,
        'cep': cep,
        'UF': estado,
        'cidade': cidade,
        'bairro': bairro,
        'logradouro': logradouro,
        'numero': numero,
        'complemento': complemento
      });
    }
  }
}
