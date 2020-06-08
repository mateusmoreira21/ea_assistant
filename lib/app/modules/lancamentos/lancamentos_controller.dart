import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/modules/lancamentos/model/lancamentos_model.dart';
import 'package:ea_assistant/app/modules/lancamentos/repositories/lancamentos_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'lancamentos_controller.g.dart';

class LancamentosController = _LancamentosControllerBase
    with _$LancamentosController;

abstract class _LancamentosControllerBase with Store {
  final ILancamentosRepository response;

  @observable
  DateTime date = new DateTime.now();
  @action
  changeDate(value) => date = value;

  @observable
  ObservableStream<List<LancamentosModel>> lancamentosList;

  _LancamentosControllerBase(ILancamentosRepository this.response) {
    getListLancamentos();
  }

  @action
  getListLancamentos() {
    lancamentosList = response.getTodosLancamentos(date).asObservable();
  }
}
