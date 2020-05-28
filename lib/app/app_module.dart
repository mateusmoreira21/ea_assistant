import 'package:ea_assistant/app/app_controller.dart';
import 'package:ea_assistant/app/modules/fornecedor/fornecedor_module.dart';
import 'package:ea_assistant/app/modules/login/login_module.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:ea_assistant/app/shared/auth/repositories/auth_repository.dart';
import 'package:ea_assistant/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:ea_assistant/app/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ea_assistant/app/app_widget.dart';
import 'package:ea_assistant/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController())
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/home/fornecedor', module: FornecedorModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
