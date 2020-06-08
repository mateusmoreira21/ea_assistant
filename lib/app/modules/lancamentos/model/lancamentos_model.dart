import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LancamentosModel {
  final auth = Modular.get<AuthController>();

  DocumentReference reference;
  Timestamp date;
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

  LancamentosModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    descricao = json['descricao'];
    tipo = json['tipo'];
    valor = json['valor'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['descricao'] = this.descricao;
    data['tipo'] = this.tipo;
    data['valor'] = this.valor;
    data['id'] = auth.user.uid;
    return data;
  }

  LancamentosModel.fromMap(Map<String, dynamic> map, String id) {
    this.date = map["date"];
    this.descricao = map["descricao"];
    this.tipo = map["tipo"];
    this.valor = map["valor"];
    this.id = map['id'];
  }
  Stream<QuerySnapshot> getListaLancamentos() {
    return Firestore.instance.collection("lancamento").snapshots();
  }

  addLancamento(
      Timestamp date, String descricao, bool tipo, double valor, String id) {
    if (id != null) {
      LancamentosModel l = LancamentosModel(
          date: date, descricao: descricao, tipo: tipo, valor: valor);
      try {
        Firestore.instance.runTransaction((Transaction transaction) async {
          await Firestore.instance
              .collection("lancamento")
              .document(id)
              .setData(l.toJson());
        });
      } catch (e) {
        print(e.toString());
      }
    } else {
      LancamentosModel l = LancamentosModel(
          date: date, descricao: descricao, tipo: tipo, valor: valor);
      try {
        Firestore.instance.runTransaction((Transaction transaction) async {
          await Firestore.instance
              .collection("lancamento")
              .document()
              .setData(l.toJson());
        });
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
