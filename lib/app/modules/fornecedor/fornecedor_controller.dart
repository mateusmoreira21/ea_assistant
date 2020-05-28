import 'package:ea_assistant/app/modules/fornecedor/models/fornecedor_model.dart';
import 'package:ea_assistant/app/modules/fornecedor/repositories/fornecedor_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'fornecedor_controller.g.dart';

class FornecedorController = _FornecedorControllerBase
    with _$FornecedorController;

abstract class _FornecedorControllerBase with Store {
  final IFornecedorRespository repository;

  @observable
  ObservableStream<List<FornecedorModel>> fornecedorList;

  _FornecedorControllerBase(IFornecedorRespository this.repository) {
    getList();
  }

  @action
  getList() {
    fornecedorList = repository.getTodos().asObservable();
  }
}
