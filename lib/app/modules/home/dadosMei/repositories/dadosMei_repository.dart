import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/modules/home/dadosMei/models/dadosMei_model.dart';
import 'package:ea_assistant/app/modules/home/dadosMei/repositories/dadosMei_repository_interface.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DadosMeiRepository implements IMeiRepository {
  final Firestore firestore;
  final auth = Modular.get<AuthController>();
  DadosMeiRepository(this.firestore);

  @override
  Stream<List<DadosMeiModel>> getDados() {
    return firestore
        .collection('users')
        .where('email', isEqualTo: auth.user.email)
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return DadosMeiModel.fromDocument(doc);
      }).toList();
    });
  }
}
