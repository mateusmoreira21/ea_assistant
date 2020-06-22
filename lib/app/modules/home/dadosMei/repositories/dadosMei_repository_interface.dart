import 'package:ea_assistant/app/modules/home/dadosMei/models/dadosMei_model.dart';

abstract class IMeiRepository {
  Stream<List<DadosMeiModel>> getDados();
}
