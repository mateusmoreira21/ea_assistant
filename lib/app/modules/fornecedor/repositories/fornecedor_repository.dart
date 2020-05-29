import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/modules/fornecedor/models/fornecedor_model.dart';
import 'package:ea_assistant/app/modules/fornecedor/repositories/fornecedor_repository_interface.dart';

class FornecedorRepository implements IFornecedorRespository {
  final Firestore firestore;

  FornecedorRepository(this.firestore);

  @override
  Stream<List<FornecedorModel>> getTodos() {
    return firestore.collection('fornecedores').snapshots().map((query) {
      return query.documents.map((doc) {
        return FornecedorModel.fromDocument(doc);
      }).toList();
    });
  }
}
