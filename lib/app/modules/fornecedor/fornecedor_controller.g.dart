// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FornecedorController on _FornecedorControllerBase, Store {
  final _$fornecedorListAtom =
      Atom(name: '_FornecedorControllerBase.fornecedorList');

  @override
  ObservableStream<List<FornecedorModel>> get fornecedorList {
    _$fornecedorListAtom.reportRead();
    return super.fornecedorList;
  }

  @override
  set fornecedorList(ObservableStream<List<FornecedorModel>> value) {
    _$fornecedorListAtom.reportWrite(value, super.fornecedorList, () {
      super.fornecedorList = value;
    });
  }

  final _$_FornecedorControllerBaseActionController =
      ActionController(name: '_FornecedorControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_FornecedorControllerBaseActionController
        .startAction(name: '_FornecedorControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_FornecedorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fornecedorList: ${fornecedorList}
    ''';
  }
}
