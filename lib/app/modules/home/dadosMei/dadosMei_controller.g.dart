// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dadosMei_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DadosMeiController on _DadosMeiControllerBase, Store {
  final _$dadosMeiListAtom = Atom(name: '_DadosMeiControllerBase.dadosMeiList');

  @override
  ObservableStream<List<DadosMeiModel>> get dadosMeiList {
    _$dadosMeiListAtom.reportRead();
    return super.dadosMeiList;
  }

  @override
  set dadosMeiList(ObservableStream<List<DadosMeiModel>> value) {
    _$dadosMeiListAtom.reportWrite(value, super.dadosMeiList, () {
      super.dadosMeiList = value;
    });
  }

  final _$_DadosMeiControllerBaseActionController =
      ActionController(name: '_DadosMeiControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_DadosMeiControllerBaseActionController.startAction(
        name: '_DadosMeiControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_DadosMeiControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dadosMeiList: ${dadosMeiList}
    ''';
  }
}
