import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/modules/home/dadosMei/dadosMei_controller.dart';
import 'package:ea_assistant/app/modules/home/dadosMei/repositories/dadosMei_repository.dart';
import 'package:ea_assistant/app/modules/home/dadosMei/repositories/dadosMei_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ea_assistant/app/modules/home/dadosMei/dadosMei_page.dart';

class DadosMeiModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DadosMeiController(i.get())),
        Bind<IMeiRepository>((i) => DadosMeiRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DadosMeiPage()),
      ];

  static Inject get to => Inject<DadosMeiModule>.of();
}
