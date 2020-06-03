import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/modules/fornecedor/models/fornecedor_model.dart';
import 'package:ea_assistant/app/modules/fornecedor/repositories/fornecedor_repository_interface.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FornecedorRepository implements IFornecedorRespository {
  final Firestore firestore;
  final auth = Modular.get<AuthController>();
  FornecedorRepository(this.firestore);

  @override
  Stream<List<FornecedorModel>> getTodos() {
    return firestore.collection('fornecedores').where('id', isEqualTo: auth.user.uid).snapshots().map((query) {
      return query.documents.map((doc) {
        return FornecedorModel.fromDocument(doc);
      }).toList();
    });
  }
}
