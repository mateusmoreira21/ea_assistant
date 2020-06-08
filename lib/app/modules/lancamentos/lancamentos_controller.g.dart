// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lancamentos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LancamentosController on _LancamentosControllerBase, Store {
  final _$dateAtom = Atom(name: '_LancamentosControllerBase.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$lancamentosListAtom =
      Atom(name: '_LancamentosControllerBase.lancamentosList');

  @override
  ObservableStream<List<LancamentosModel>> get lancamentosList {
    _$lancamentosListAtom.reportRead();
    return super.lancamentosList;
  }

  @override
  set lancamentosList(ObservableStream<List<LancamentosModel>> value) {
    _$lancamentosListAtom.reportWrite(value, super.lancamentosList, () {
      super.lancamentosList = value;
    });
  }

  final _$_LancamentosControllerBaseActionController =
      ActionController(name: '_LancamentosControllerBase');

  @override
  dynamic changeDate(dynamic value) {
    final _$actionInfo = _$_LancamentosControllerBaseActionController
        .startAction(name: '_LancamentosControllerBase.changeDate');
    try {
      return super.changeDate(value);
    } finally {
      _$_LancamentosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getListLancamentos() {
    final _$actionInfo = _$_LancamentosControllerBaseActionController
        .startAction(name: '_LancamentosControllerBase.getListLancamentos');
    try {
      return super.getListLancamentos();
    } finally {
      _$_LancamentosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
date: ${date},
lancamentosList: ${lancamentosList}
    ''';
  }
}
