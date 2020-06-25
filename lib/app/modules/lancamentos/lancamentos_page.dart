import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/animation/FadeAnimation.dart';
import 'package:ea_assistant/app/modules/lancamentos/cadastroLancamento_page.dart';
import 'package:ea_assistant/app/modules/lancamentos/model/lancamentos_model.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';
import 'lancamentos_controller.dart';
import 'package:intl/intl.dart';

final auth = Modular.get<AuthController>();

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
  final auth = Modular.get<AuthController>();
  Future retornaFuture(auth) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn;
    if (dataInicial != null) {
      qn = await firestore
          .collection("lancamento")
          .where("date",
              isGreaterThanOrEqualTo: Timestamp.fromDate(dataInicial))
          .where("date",
              isLessThanOrEqualTo: Timestamp.fromDate(dataFinal.toUtc()))
          .getDocuments();
    } else {
      qn = await firestore
          .collection("lancamento")
          .where("date", isLessThanOrEqualTo: Timestamp.fromDate(dataAtual))
          .where("id", isEqualTo: auth.user.uid)
          .getDocuments();
    }
    return qn;
  }

  LancamentosModel l = LancamentosModel();
  List<LancamentosModel> items;
  var db = Firestore.instance;
  StreamSubscription<QuerySnapshot> lancamentoInscricao;

  @override
  void initState() {
    dataInicial = new DateTime(dataAtual.year, (dataAtual.month), 1, 0);
    dataFinal = new DateTime(dataAtual.year, (dataAtual.month + 1), 0);
    print("DataFinal $dataFinal");
    print("DataInicial $dataInicial");
    super.initState();
    calendarController = CalendarController();
    items = List();
    lancamentoInscricao?.cancel();

    lancamentoInscricao = db
        .collection("lancamento")
<<<<<<< HEAD
=======
        .where("id", isEqualTo: auth.user.uid)
>>>>>>> 6ae10cdb1ed19a2a488be7582252546617ca1278
        .where("date", isGreaterThanOrEqualTo: Timestamp.fromDate(data))
        .where("date", isLessThan: Timestamp.fromDate(dataAtual))
        .snapshots()
        .listen((snapshot) {
      final List<LancamentosModel> lancamentos = snapshot.documents
          .map(
            (documentSnapshot) => LancamentosModel.fromMap(
                documentSnapshot.data, documentSnapshot.documentID),
          )
          .toList();
      setState(() {
        this.items = lancamentos;
        print(items.length);
      });
    });
  }

  @override
  void dispose() {
    lancamentoInscricao?.cancel();
    super.dispose();
  }

  var dataAtual = new DateTime.now();
  var dataInicial;
  DateTime dataFinal;

  var data = DateTime.parse("2020-03-01 12:00:00.000Z");

  var formatter = new DateFormat('dd-MM-yyyy');
  var formatterCalendar = new DateFormat('MM-yyyy');
  CalendarController calendarController;
  String dataFormatada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CadastroLancamento(
                      LancamentosModel(descricao: "", valor: 0, id: null))));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            TableCalendar(
              calendarController: calendarController,
              locale: "pt_BR",
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
                formatButtonShowsNext: false,
                formatButtonVisible: false,
                centerHeaderTitle: true,
              ),
              calendarStyle: CalendarStyle(
                  outsideDaysVisible: false, contentPadding: EdgeInsets.all(0)),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.transparent),
                weekendStyle: TextStyle(color: Colors.transparent),
              ),
              rowHeight: 0,
              initialCalendarFormat: CalendarFormat.month,
              onVisibleDaysChanged: (dateFirst, dateLast, CalendarFormat cf) {
                print(dateFirst);
                setState(() {
                  dataInicial = dateFirst;
                  dataFinal = dateLast;
                });
                dataFormatada = formatterCalendar.format(dateFirst);
                // _allMovMes(dataFormatada);

                print("DATA FORMATADA CALENDAR $dataFormatada");

                //print("Data Inicial: $dateFirst ....... Data Final: $dateLast");
              },
            ),
            Text(
              "Todos os lançamentos desse mês",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder(
                  /*meus dados*/ future: retornaFuture(auth),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        List<DocumentSnapshot> documentos =
                            snapshot.data.documents;
                        return ListView.builder(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 80),
                          itemCount: documentos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FadeAnimation(
                              0.4,
                              Card(
                                color: documentos[index]["tipo"] == false
                                    ? Colors.red[300]
                                    : Colors.green,
                                child: ListTile(
                                  leading: Icon(Icons.monetization_on),
                                  trailing: Wrap(
                                    spacing: 10, // space between two icons
                                    children: <Widget>[
                                      IconButton(
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(Icons.edit),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(Icons.delete_forever),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    snapshot.data.documents[index]["descricao"],
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'R\$ ' +
                                        snapshot.data.documents[index]["valor"]
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
