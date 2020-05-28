import 'package:ea_assistant/app/app_controller.dart';
import 'package:ea_assistant/app/modules/fornecedor/models/fornecedor_model.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'fornecedor_controller.dart';

class FornecedorPage extends StatefulWidget {
  final String title;
  const FornecedorPage({Key key, this.title = "Fornecedores"})
      : super(key: key);

  @override
  _FornecedorPageState createState() => _FornecedorPageState();
}

class _FornecedorPageState
    extends ModularState<FornecedorPage, FornecedorController> {
  //use 'controller' variable to access controller
  final user = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () {},
          child: Icon(
            Icons.add,
          ),
        ),
        body: Observer(builder: (_) {
          if (controller.fornecedorList.hasError) {
            print(controller.fornecedorList.error);
            return Center(
                child: RaisedButton(
              onPressed: controller.getList(),
              child: Text('Error'),
            ));
          }
          if (controller.fornecedorList.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<FornecedorModel> list = controller.fornecedorList.data;

          return ListView.builder(
              padding: EdgeInsets.only(bottom: 80, left: 10, right: 10),
              itemCount: list.length,
              itemBuilder: (_, index) {
                FornecedorModel model = list[index];
                if (model.id == user.getUser()) {
                  return ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: 50,
                        color: Colors.black,
                      ),
                      title: Text(model.nomeFantasia),
                      subtitle: Text(model.cnpj),
                      trailing: Wrap(
                        spacing: 2,
                        children: <Widget>[
                          IconButton(
                              color: Colors.green,
                              icon: const Icon(Icons.edit),
                              onPressed: () {}),
                          IconButton(
                              color: Colors.red,
                              icon: const Icon(Icons.delete),
                              onPressed: () {})
                        ],
                      ));
                }
              });
        }));
  }
}
