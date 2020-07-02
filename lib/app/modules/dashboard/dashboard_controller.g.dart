// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on _DashboardControllerBase, Store {
  final _$totalAtom = Atom(name: '_DashboardControllerBase.total');

  @override
  double get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  final _$dataInicialAtom = Atom(name: '_DashboardControllerBase.dataInicial');

  @override
  dynamic get dataInicial {
    _$dataInicialAtom.reportRead();
    return super.dataInicial;
  }

  @override
  set dataInicial(dynamic value) {
    _$dataInicialAtom.reportWrite(value, super.dataInicial, () {
      super.dataInicial = value;
    });
  }

  final _$dataFinalAtom = Atom(name: '_DashboardControllerBase.dataFinal');

  @override
  DateTime get dataFinal {
    _$dataFinalAtom.reportRead();
    return super.dataFinal;
  }

  @override
  set dataFinal(DateTime value) {
    _$dataFinalAtom.reportWrite(value, super.dataFinal, () {
      super.dataFinal = value;
    });
  }

  final _$totalReceitaAtom =
      Atom(name: '_DashboardControllerBase.totalReceita');

  @override
  double get totalReceita {
    _$totalReceitaAtom.reportRead();
    return super.totalReceita;
  }

  @override
  set totalReceita(double value) {
    _$totalReceitaAtom.reportWrite(value, super.totalReceita, () {
      super.totalReceita = value;
    });
  }

  final _$totalDespesaAtom =
      Atom(name: '_DashboardControllerBase.totalDespesa');

  @override
  double get totalDespesa {
    _$totalDespesaAtom.reportRead();
    return super.totalDespesa;
  }

  @override
  set totalDespesa(double value) {
    _$totalDespesaAtom.reportWrite(value, super.totalDespesa, () {
      super.totalDespesa = value;
    });
  }

  final _$statusAtom = Atom(name: '_DashboardControllerBase.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$itemsAtom = Atom(name: '_DashboardControllerBase.items');

  @override
  List<LancamentosModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<LancamentosModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$_DashboardControllerBaseActionController =
      ActionController(name: '_DashboardControllerBase');

  @override
  dynamic alteraTotal(dynamic value) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.alteraTotal');
    try {
      return super.alteraTotal(value);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic altDataInicial(dynamic value) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.altDataInicial');
    try {
      return super.altDataInicial(value);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic altDataFinal(dynamic value) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.altDataFinal');
    try {
      return super.altDataFinal(value);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validaStatus() {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.validaStatus');
    try {
      return super.validaStatus();
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
total: ${total},
dataInicial: ${dataInicial},
dataFinal: ${dataFinal},
totalReceita: ${totalReceita},
totalDespesa: ${totalDespesa},
status: ${status},
items: ${items}
    ''';
  }
}
