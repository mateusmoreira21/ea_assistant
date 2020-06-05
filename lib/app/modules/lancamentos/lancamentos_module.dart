import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/modules/lancamentos/repositories/lancamentos_repository.dart';
import 'package:ea_assistant/app/modules/lancamentos/lancamentos_controller.dart';
import 'package:ea_assistant/app/modules/lancamentos/repositories/lancamentos_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ea_assistant/app/modules/lancamentos/lancamentos_page.dart';

class LancamentosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LancamentosController(i.get())),
        Bind<ILancamentosRepository>(
            (i) => LancamentosRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LancamentosPage()),
      ];

  static Inject get to => Inject<LancamentosModule>.of();
}
