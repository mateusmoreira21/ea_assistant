import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/modules/lancamentos/model/lancamentos_model.dart';
import 'package:ea_assistant/app/modules/lancamentos/repositories/lancamentos_repository_interface.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LancamentosRepository implements ILancamentosRepository {
  final Firestore firestore;
  final auth = Modular.get<AuthController>();
  LancamentosRepository(this.firestore);

  @override
  Stream<List<LancamentosModel>> getTodosLancamentos(date) {
    return firestore
        .collection('lancamentos')
        .where('id', isEqualTo: auth.user.uid)
        .where("date", isLessThanOrEqualTo: Timestamp.fromDate(date))
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return LancamentosModel.fromDocument(doc);
      }).toList();
    });
  }
}
