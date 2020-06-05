import 'package:ea_assistant/app/modules/lancamentos/model/lancamentos_model.dart';
import 'package:ea_assistant/app/modules/lancamentos/repositories/lancamentos_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'lancamentos_controller.g.dart';

class LancamentosController = _LancamentosControllerBase
    with _$LancamentosController;

abstract class _LancamentosControllerBase with Store {
  final ILancamentosRepository response;

  @observable
  ObservableStream<List<LancamentosModel>> lancamentosList;

  _LancamentosControllerBase(this.response) {
    getListLancamentos();
  }

  @action
  getListLancamentos() {
    lancamentosList = response.getTodosLancamentos().asObservable();
  }
}
