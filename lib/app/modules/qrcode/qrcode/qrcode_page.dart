import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'qrcode_controller.dart';

class QrcodePage extends StatefulWidget {
  final String title;
  const QrcodePage({Key key, this.title = "Qrcode"}) : super(key: key);

  @override
  _QrcodePageState createState() => _QrcodePageState();
}

class _QrcodePageState extends ModularState<QrcodePage, QrcodeController> {
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
