import 'package:ea_assistant/app/modules/login/signup/signup_controller.dart';
import 'package:ea_assistant/app/modules/login/signup/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignupModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignupController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SignupPage()),
      ];

  static Inject get to => Inject<SignupModule>.of();
}
