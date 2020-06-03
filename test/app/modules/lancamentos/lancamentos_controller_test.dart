import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ea_assistant/app/modules/lancamentos/lancamentos_controller.dart';
import 'package:ea_assistant/app/modules/lancamentos/lancamentos_module.dart';

void main() {
  initModule(LancamentosModule());
  // LancamentosController lancamentos;
  //
  setUp(() {
    //     lancamentos = LancamentosModule.to.get<LancamentosController>();
  });

  group('LancamentosController Test', () {
    //   test("First Test", () {
    //     expect(lancamentos, isInstanceOf<LancamentosController>());
    //   });

    //   test("Set Value", () {
    //     expect(lancamentos.value, equals(0));
    //     lancamentos.increment();
    //     expect(lancamentos.value, equals(1));
    //   });
  });
}
