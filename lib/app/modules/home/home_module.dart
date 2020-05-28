import 'package:ea_assistant/app/modules/fornecedor/fornecedor_module.dart';
import 'package:ea_assistant/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ea_assistant/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/fornecedor', module: FornecedorModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
