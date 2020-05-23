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
      "Cadastro de Mei",
      "Fornecedores",
      "Dashboard",
      "Lançamentos",
      "Editar Dados",
      "OCR"
    ];
  }

  images() {
    return [
      "lib/app/images/icons/mei.png",
      "lib/app/images/icons/fornecedor.png",
      "lib/app/images/icons/dashboard.png",
      "lib/app/images/icons/lancamento.png",
      "lib/app/images/icons/config.png",
      "lib/app/images/icons/scan.png",
    ];
  }

}
