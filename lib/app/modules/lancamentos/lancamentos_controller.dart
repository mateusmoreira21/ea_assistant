import 'package:mobx/mobx.dart';

part 'lancamentos_controller.g.dart';

class LancamentosController = _LancamentosControllerBase
    with _$LancamentosController;

abstract class _LancamentosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
