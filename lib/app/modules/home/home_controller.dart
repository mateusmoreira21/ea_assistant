import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  logoff() async {
    await Modular.get<AuthController>().logOut();
    Modular.to.pushReplacementNamed('/login');
  }

  services() {
    return [
      "Fornecedores",
      "Dashboard",
      "Lançamentos",
      "Consultar NFCE na receita",
    ];
  }

  images() {
    return [
      "lib/app/images/icons/fornecedor.png",
      "lib/app/images/icons/dashboard.png",
      "lib/app/images/icons/lancamento.png",
      "lib/app/images/icons/qrcode.png",
    ];
  }
}
