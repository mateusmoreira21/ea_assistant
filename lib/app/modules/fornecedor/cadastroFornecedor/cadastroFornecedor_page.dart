import 'package:ea_assistant/app/modules/fornecedor/cadastroFornecedor/cadastroFornecedor_controller.dart';
import 'package:ea_assistant/app/modules/fornecedor/models/fornecedor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class CadastroFornecedorPage extends StatefulWidget {
  final String title;
  const CadastroFornecedorPage({Key key, this.title = "CadastroFornecedor"})
      : super(key: key);

  @override
  _CadastroFornecedorPageState createState() => _CadastroFornecedorPageState();
}

class _CadastroFornecedorPageState
    extends ModularState<CadastroFornecedorPage, CadastroFornecedorController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(builder: (_) {
          List<FornecedorModel> editList;
          Column(
            children: <Widget>[
              ListView.builder(
                itemCount: editList.length,
                itemBuilder: (_, index) {
                  FornecedorModel editModel = editList[index];
                  return TextFormField(
                    onChanged: (value) => editModel,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'escreva...',
                    ),
                  );
                },
              ),
            ],
          );
        }));
  }
}
//     showDialog(
//         context: context,
//         builder: (_) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.zero,
//             title: Text('Adicionar Fornecedor'),
//             content:
//             actions: <Widget>[
//               FlatButton(
//                 onPressed: () async {
//                   await editModel.save();
//                   Modular.to.pop();
//                 },
//                 child: Text('Cancelar'),
//               ),
//               FlatButton(
//                 onPressed: () {
//                   Modular.to.pop();
//                 },
//                 child: Text('Adicionar'),
//               )
//             ],
//           );
//         });
//   }
// }
