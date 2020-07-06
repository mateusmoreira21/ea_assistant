import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/modules/lancamentos/model/lancamentos_model.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final firestore = Firestore.instance;
  final auth = Modular.get<AuthController>();

  _DashboardControllerBase() {
    var dataAtual = DateTime.now();
    dataInicial = new DateTime(dataAtual.year, (dataAtual.month), 1, 0);
    dataFinal = new DateTime(dataAtual.year, (dataAtual.month + 1), 0);

    print("DataInicial $dataInicial");
    print("DataFinal $dataFinal");
    retornaFuture();
    validaStatus();
  }

  @observable
  double total = 0;

  @observable
  var dataInicial;

  @observable
  DateTime dataFinal;

  @observable
  double totalReceita = 0;

  @observable
  double totalDespesa = 0;

  @observable
  String status;

  @observable
  List<LancamentosModel> items;

  @action
  alteraTotal(value) => total = value;

  @action
  altDataInicial(value) => dataInicial = value;

  @action
  altDataFinal(value) => dataFinal = value;

  @action
  validaStatus() {
    if (total < 0) {
      status = "PREJUÍZO";
    } else if (total > 0) {
      status = "LUCRO";
    } else {
      status = "Equilíbrio entre Receitas e Despesas";
    }
  }

  Future<QuerySnapshot> retornaFuture() async {
    firestore
        .collection("lancamento")
        .where('id', isEqualTo: auth.user.uid)
        .where("date", isGreaterThanOrEqualTo: Timestamp.fromDate(dataInicial))
        .where("date", isLessThanOrEqualTo: Timestamp.fromDate(dataFinal))
        .snapshots()
        .listen((snapshot) {
      List<LancamentosModel> lancamentos = snapshot.documents
          .map(
            (documentSnapshot) => LancamentosModel.fromMap(
                documentSnapshot.data, documentSnapshot.documentID),
          )
          .toList();

      items = lancamentos;
      totalReceita = 0;
      totalDespesa = 0;

      items.forEach((element) {
        if (element.tipo == true) {
          totalReceita += element.valor;
        } else if (element.tipo == false) {
          totalDespesa += element.valor;
        }
      });
      print(totalReceita);
      print(totalDespesa);
      alteraTotal(totalReceita - totalDespesa);
      validaStatus();

      return snapshot;
    });
    return null;
  }
}
