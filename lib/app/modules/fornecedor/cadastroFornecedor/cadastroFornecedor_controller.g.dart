// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastroFornecedor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroFornecedorController
    on _CadastroFornecedorControllerBase, Store {
  final _$cFornecedorListAtom =
      Atom(name: '_CadastroFornecedorControllerBase.cFornecedorList');

  @override
  ObservableStream<List<FornecedorModel>> get cFornecedorList {
    _$cFornecedorListAtom.reportRead();
    return super.cFornecedorList;
  }

  @override
  set cFornecedorList(ObservableStream<List<FornecedorModel>> value) {
    _$cFornecedorListAtom.reportWrite(value, super.cFornecedorList, () {
      super.cFornecedorList = value;
    });
  }

  @override
  String toString() {
    return '''
cFornecedorList: ${cFornecedorList}
    ''';
  }
}
