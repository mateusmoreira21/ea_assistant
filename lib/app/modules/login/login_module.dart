import 'package:ea_assistant/app/modules/login/login_controller.dart';
import 'package:ea_assistant/app/modules/login/reset/reset_module.dart';
import 'package:ea_assistant/app/modules/login/signup/signup_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ea_assistant/app/modules/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
        Router('/signup', module: SignupModule()),
        Router('/reset', module: ResetModule())
      ];

  static Inject get to => Inject<LoginModule>.of();
}
