import 'package:cloud_firestore/cloud_firestore.dart';

class FornecedorModel {
  String nomeFantasia;
  String razaoSocial;
  String cnpj;
  String logradouro;
  int numero;
  String id;
  String cep;
  String cidade;
  String estado;
  String bairro;
  String complemento = 'S/C';
  final DocumentReference reference;

  FornecedorModel(
      {this.reference,
      this.nomeFantasia,
      this.razaoSocial,
      this.cnpj,
      this.id,
      this.cep,
      this.estado,
      this.cidade,
      this.bairro,
      this.logradouro,
      this.numero,
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
}
