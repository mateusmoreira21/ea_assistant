import 'package:ea_assistant/app/modules/fornecedor/cadastroFornecedor/cadastroFornecedor_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ea_assistant/app/modules/fornecedor/cadastroFornecedor/cadastroFornecedor_page.dart';

class CadastroFornecedorModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CadastroFornecedorController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => CadastroFornecedorPage()),
      ];

  static Inject get to => Inject<CadastroFornecedorModule>.of();
}
