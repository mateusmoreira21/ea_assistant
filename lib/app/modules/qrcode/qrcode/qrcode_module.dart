import 'package:ea_assistant/app/modules/qrcode/qrcode/qrcode_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ea_assistant/app/modules/qrcode/qrcode/qrcode_page.dart';

class QrcodeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => QrcodeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => QrcodePage()),
      ];

  static Inject get to => Inject<QrcodeModule>.of();
}
