import 'package:mobx/mobx.dart';

part 'qrcode_controller.g.dart';

class QrcodeController = _QrcodeControllerBase with _$QrcodeController;

abstract class _QrcodeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
