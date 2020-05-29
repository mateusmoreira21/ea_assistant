import 'package:ea_assistant/app/modules/fornecedor/models/fornecedor_model.dart';
import 'package:mobx/mobx.dart';

part 'cadastroFornecedor_controller.g.dart';

class CadastroFornecedorController = _CadastroFornecedorControllerBase
    with _$CadastroFornecedorController;

abstract class _CadastroFornecedorControllerBase with Store {
  @observable
  ObservableStream<List<FornecedorModel>> cFornecedorList;
}
