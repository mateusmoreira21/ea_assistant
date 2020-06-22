import 'package:ea_assistant/app/modules/home/dadosMei/models/dadosMei_model.dart';
import 'package:ea_assistant/app/modules/home/dadosMei/repositories/dadosMei_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'dadosMei_controller.g.dart';

class DadosMeiController = _DadosMeiControllerBase with _$DadosMeiController;

abstract class _DadosMeiControllerBase with Store {
  final IMeiRepository repository;

  @observable
  ObservableStream<List<DadosMeiModel>> dadosMeiList;

  _DadosMeiControllerBase(IMeiRepository this.repository) {
    getList();
  }

  @action
  getList() {
    dadosMeiList = repository.getDados().asObservable();
  }
}
