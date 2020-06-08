import 'package:ea_assistant/app/modules/lancamentos/model/lancamentos_model.dart';

abstract class ILancamentosRepository {
  Stream<List<LancamentosModel>> getTodosLancamentos(date);
}
