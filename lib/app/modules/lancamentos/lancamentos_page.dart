import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/animation/FadeAnimation.dart';
import 'package:ea_assistant/app/modules/lancamentos/model/lancamentos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';
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
  

    Future retornaFuture() async {
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
  }

  @override
  void dispose() {
    lancamentoInscricao?.cancel();
    super.dispose();
  }

  var lista = [
    "Aluguel",
    "Venda de Produto",
    "Conta de luz",
  ];
  var cor = [
    false,
    true,
    false,
  ];
  var dataAtual = new DateTime.now();

  var data = DateTime.parse("2020-03-01 12:00:00.000Z");

  CalendarController calendarController;
  String dataFormatada;
  var dataInicial;
  DateTime dataFinal;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  /*meus dados*/ future: retornaFuture(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        List<LancamentosModel> lancamentos =
                            controller.lancamentosList.data;
                        return ListView.builder(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 80),
                          itemCount: lancamentos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FadeAnimation(
                              0.4,
                              Card(
                                color: controller.lancamentosList.data.documents[index]["tipo"] ==
                                        false
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
