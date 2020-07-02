import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ea_assistant/app/animation/FadeAnimation.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dashboard_controller.dart';

final auth = Modular.get<AuthController>();

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  //use 'controller' variable to access controller

  final calendarController = CalendarController();
  final menu = ["Total do Mês", "Despesas do Mês", "Receitas do Mês"];
  var tipo = ["b", "d", "r"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Color _getMyColor(var tipo) {
    if (tipo == "r") {
      return Colors.lightGreen;
    } else if (tipo == "d") {
      return Colors.redAccent;
    } else
      return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard"),
      ),
      body: Observer(builder: (_) {
        return Column(
          children: <Widget>[
            buildCalendar(),
            buildCard(),
            buildList(),
          ],
        );
      }),
    );
  }

  Expanded buildList() {
    return Expanded(
      child: FutureBuilder(
          future: controller.retornaFuture(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                var array = [
                  "R\$${controller.total.toStringAsFixed(2)}",
                  "R\$ ${controller.totalDespesa}",
                  "R\$ ${controller.totalReceita}",
                ];
                return GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: array.length,
                    gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 5.1),
                    )),
                    itemBuilder: (BuildContext context, int index) {
                      return FadeAnimation(
                        1.5,
                        Card(
                          color: _getMyColor(tipo[index]),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    menu[index],
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  array[index],
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
            }
          }),
    );
  }

  FadeAnimation buildCard() {
    return FadeAnimation(
      1.3,
      Card(
        child: ListTile(
          subtitle: Observer(builder: (_) {
            return Text(
              controller.status,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17, color: Colors.red, fontWeight: FontWeight.w800),
            );
          }),
          title: Center(
              child: Text(
            "Nesse mês sua empresa obteve ",
            style: TextStyle(
                fontWeight: FontWeight.w800, color: Colors.deepPurple),
          )),
        ),
      ),
    );
  }

  TableCalendar buildCalendar() {
    return TableCalendar(
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
        print(dateLast);
        controller.altDataInicial(dateFirst);
        controller.altDataFinal(dateLast);

        // print("DATA FORMATADA CALENDAR $dataFormatada");

        //print("Data Inicial: $dateFirst ....... Data Final: $dateLast");
      },
    );
  }
}
