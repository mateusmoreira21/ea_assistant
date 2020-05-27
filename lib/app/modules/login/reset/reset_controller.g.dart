// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResetController on _ResetControllerBase, Store {
  final _$emailUserAtom = Atom(name: '_ResetControllerBase.emailUser');

  @override
  String get emailUser {
    _$emailUserAtom.reportRead();
    return super.emailUser;
  }

  @override
  set emailUser(String value) {
    _$emailUserAtom.reportWrite(value, super.emailUser, () {
      super.emailUser = value;
    });
  }

  final _$resetPassAsyncAction = AsyncAction('_ResetControllerBase.resetPass');

  @override
  Future<dynamic> resetPass(BuildContext context) {
    return _$resetPassAsyncAction.run(() => super.resetPass(context));
  }

  final _$_ResetControllerBaseActionController =
      ActionController(name: '_ResetControllerBase');

  @override
  dynamic changeEmailUser(String value) {
    final _$actionInfo = _$_ResetControllerBaseActionController.startAction(
        name: '_ResetControllerBase.changeEmailUser');
    try {
      return super.changeEmailUser(value);
    } finally {
      _$_ResetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailUser: ${emailUser}
    ''';
  }
}
