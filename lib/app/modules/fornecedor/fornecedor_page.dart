import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:ea_assistant/app/modules/fornecedor/models/fornecedor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
  final auth = Modular.get<AuthController>();

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
          onPressed: _showDialog,
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

                print(auth.user.uid);
                if (model.id != auth.user.uid || auth.user.uid == null) {
                  return Center(
                    child: Text('Sem Fornecedores'),
                  );
                } else {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        var alertStyle = AlertStyle(
                            animationType: AnimationType.grow,
                            isCloseButton: false,
                            isOverlayTapDismiss: false,
                            descStyle: TextStyle(fontWeight: FontWeight.bold),
                            animationDuration: Duration(milliseconds: 200),
                            alertBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            titleStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            constraints: BoxConstraints.expand());
                        Alert(
                          context: context,
                          style: alertStyle,
                          title: "Informações deste fornecedor",
                          content: Column(
                            children: <Widget>[
                              getRowAlert(
                                  "Razão social", "${model.razaoSocial}"),
                              getRowAlert("Cnpj", "${model.cnpj}"),
                              getRowAlert("Cidade", "${model.cidade}"),
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Voltar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                              radius: BorderRadius.circular(0.0),
                            ),
                          ],
                        ).show();
                      },
                      child: ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            size: 50,
                            color: Colors.black54,
                          ),
                          title: Text(model.nomeFantasia),
                          subtitle: Text(model.cnpj),
                          trailing: Wrap(
                            spacing: 2,
                            children: <Widget>[
                              IconButton(
                                  color: Colors.green,
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    _showDialog(model);
                                  }),
                              IconButton(
                                  color: Colors.red,
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {})
                            ],
                          )),
                    ),
                  );
                }
              });
        }));
  }

  _showDialog([FornecedorModel editModel]) {
    editModel ??= FornecedorModel();
    showDialog(
        context: context,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: Text(editModel.id.isEmpty
                    ? 'Adicionar Fornecedor'
                    : 'Editar Fornecedor')),
            body: Card(
                child: ListView(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              children: <Widget>[
                TextFormField(
                  initialValue: editModel.razaoSocial,
                  onChanged: (value) => editModel.razaoSocial = value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Razão Social',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  initialValue: editModel.nomeFantasia,
                  onChanged: (value) => editModel.nomeFantasia = value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome Fantasia',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  initialValue: editModel.cnpj,
                  onChanged: (value) => editModel.cnpj = value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CNPJ',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  initialValue: editModel.cep,
                  onChanged: (value) => editModel.cep = value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CEP',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  initialValue: editModel.estado,
                  onChanged: (value) => editModel.estado = value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Estado',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  initialValue: editModel.cidade,
                  onChanged: (value) => editModel.cidade = value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cidade',
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.deepPurple),
                  child: Builder(
                    builder: (context) => MaterialButton(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                            editModel.id.isEmpty
                                ? 'Adicionar Novo Fornecedor'
                                : 'Atualizar Fornecedor',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      onPressed: () async {
                        await editModel.save();
                        Modular.to.pop();
                      },
                    ),
                  ),
                ),
              ],
            )),
          );
        });
  }

  getRowAlert(String primeiro, String segundo) {
    return Row(
      children: <Widget>[
        Text(
          "$primeiro: ",
          style: TextStyle(fontSize: 16),
          overflow: TextOverflow.fade,
        ),
        Flexible(
          flex: 1,
          child: Text(
            "$segundo",
            style: TextStyle(fontSize: 14, color: Colors.deepPurple),
          ),
        )
      ],
    );
  }
}
