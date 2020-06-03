import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'lancamentos_controller.dart';

class LancamentosPage extends StatefulWidget {
  final String title;
  const LancamentosPage({Key key, this.title = "Lancamentos"})
      : super(key: key);

  @override
  _LancamentosPageState createState() => _LancamentosPageState();
}

class _LancamentosPageState
    extends ModularState<LancamentosPage, LancamentosController> {
  //use 'controller' variable to access controller
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
