import 'package:cloud_firestore/cloud_firestore.dart';

class LancamentosModel {
  DocumentReference reference;
  String date;
  String descricao;
  bool tipo;
  double valor;
  String id;

  LancamentosModel( 
    {this.reference,
    this.date, 
    this.descricao, 
    this.tipo, 
    this.valor, 
    this.id});

  factory LancamentosModel.fromDocument(DocumentSnapshot doc) {
    return LancamentosModel(
    reference: doc.reference,
    date: doc['date'],
    descricao: doc['descricao'],
    tipo: doc['tipo'],
    valor: doc['valor'],
    );
  }

}

