import 'package:ea_assistant/app/modules/dashboard/dashboard_module.dart';
import 'package:ea_assistant/app/modules/fornecedor/fornecedor_module.dart';
import 'package:ea_assistant/app/modules/home/home_controller.dart';
import 'package:ea_assistant/app/modules/home/sobre_page.dart';
import 'package:ea_assistant/app/modules/lancamentos/lancamentos_module.dart';
import 'package:ea_assistant/app/shared/auth/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ea_assistant/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds =>
      [Bind((i) => HomeController()), Bind((i) => AuthRepository())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/sobre', child: (_, args) => SobrePage()),
        Router('/fornecedor', module: FornecedorModule()),
        Router('/lancamentos', module: LancamentosModule()),
        Router('/dashboard', module: DashboardModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
