import 'package:ea_assistant/app/modules/login/reset/reset_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ea_assistant/app/modules/login/reset/reset_page.dart';

class ResetModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ResetController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ResetPage()),
      ];

  static Inject get to => Inject<ResetModule>.of();
}
