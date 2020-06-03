import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/modules/fornecedor/fornecedor_controller.dart';
import 'package:ea_assistant/app/modules/fornecedor/repositories/fornecedor_repository.dart';
import 'package:ea_assistant/app/modules/fornecedor/repositories/fornecedor_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ea_assistant/app/modules/fornecedor/fornecedor_page.dart';

class FornecedorModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FornecedorController(i.get())),
        Bind<IFornecedorRespository>(
            (i) => FornecedorRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FornecedorPage()),
      ];

  static Inject get to => Inject<FornecedorModule>.of();
}
