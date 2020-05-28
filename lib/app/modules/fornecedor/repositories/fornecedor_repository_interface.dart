import 'package:ea_assistant/app/modules/fornecedor/models/fornecedor_model.dart';

abstract class IFornecedorRespository {
  Stream<List<FornecedorModel>> getTodos();
}
