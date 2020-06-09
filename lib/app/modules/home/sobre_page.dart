import 'package:flutter/material.dart';

class SobrePage extends StatefulWidget {
  final String title;
  const SobrePage({Key key, this.title = "Sobre"}) : super(key: key);

  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Image.asset(
              'lib/app/images/sobre.jpg',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Text(
                  "Bem vindo ao EA Assistant \nO novo parceiro do MEI",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.deepPurple),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Com ele é possível controlar todos os seus débitos, créditos e gastos futuros. O EA Assistant foi criado a partir da ideia do grupo X, com o objetivo de facilitar o controle de gastos de todos os MEI's no dia a dia e também conta com um cadastro de fornecedores para que você MEI, esteja sempre mantendo sua lista de fornecedores atualizada.",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Nossa equipe:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.deepPurple),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _RetornaFoto("MateusM.jpeg", "Mateus M."),
                      SizedBox(
                        width: 10,
                      ),
                      _RetornaFoto("MatheusC.jpeg", "Matheus C."),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _RetornaFoto("Ygor.jpg", "Ygor S."),
                      SizedBox(
                        width: 10,
                      ),
                      _RetornaFoto("Josue.jpeg", "Josué O."),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _RetornaFoto("Italo.jpeg", "Italo"),
                      SizedBox(
                        width: 10,
                      ),
                      _RetornaFoto("gay.jpg", "Arthur B."),
                    ],
                  ),
                ]),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _RetornaFoto(String foto, String nome) {
    var altura = MediaQuery.of(context).size.height;
    var largura = MediaQuery.of(context).size.width;
    return Container(
        width: 100,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'lib/app/images/$foto',
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "$nome",
                  style: TextStyle(
                      fontSize: altura * 0.025,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ));
  }
}
