import 'package:ea_assistant/app/modules/home/dadosMei/models/dadosMei_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dadosMei_controller.dart';

class DadosMeiPage extends StatefulWidget {
  final String title;
  const DadosMeiPage({Key key, this.title = "Dados Mei"}) : super(key: key);

  @override
  _DadosMeiPageState createState() => _DadosMeiPageState();
}

class _DadosMeiPageState
    extends ModularState<DadosMeiPage, DadosMeiController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(builder: (_) {
          if (controller.dadosMeiList.hasError) {
            print(controller.dadosMeiList.error);
            return Center(
                child: RaisedButton(
              onPressed: controller.getList(),
              child: Text('Error'),
            ));
          }
          if (controller.dadosMeiList.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DadosMeiModel> list = controller.dadosMeiList.data;

          var telefoneMask = MaskTextInputFormatter(
              mask: "(##) # ####-####", filter: {"#": RegExp(r'[0-9]')});
          var cnpjMask = MaskTextInputFormatter(
              mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});

          return Card(
            child: ListView.builder(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                itemCount: list.length,
                itemBuilder: (_, index) {
                  DadosMeiModel dados = list[index];
                  return Wrap(
                    children: <Widget>[
                      TextFormField(
                        initialValue: dados.name,
                        onChanged: (value) => dados.name = value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome Responsável',
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(12)),
                      TextFormField(
                        initialValue: dados.email,
                        onChanged: (value) => dados.email = value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(12)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [cnpjMask],
                        initialValue: dados.cnpj,
                        onChanged: (value) => dados.cnpj = value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CNPJ',
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(12)),
                      TextFormField(
                        initialValue: dados.nomeFantasia,
                        onChanged: (value) => dados.nomeFantasia = value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome Fantasia',
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(12)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [telefoneMask],
                        initialValue: dados.telefone,
                        onChanged: (value) => dados.telefone = value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Telefone',
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(12)),
                      TextFormField(
                        initialValue: dados.descricao,
                        onChanged: (value) => dados.descricao = value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Descrição',
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(40)),
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
                              child: Text('Salvar Dados',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                            onPressed: () async {
                              await dados.save();
                              Modular.to.pushReplacementNamed('/home');
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          );
        }));
  }
}
