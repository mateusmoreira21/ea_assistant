import 'package:ea_assistant/app/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ea_assistant/app/shared/auth/auth_controller.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final auth = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(widget.title),
          actions: <Widget>[
            auth.user != null
                ? IconButton(
                    icon: Icon(Icons.clear), onPressed: controller.logoff)
                : Container(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    Colors.deepPurple[700],
                    Colors.deepPurple[600],
                    Colors.blueAccent
                  ])),
                  child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: Icon(
                        Icons.supervised_user_circle,
                        size: 100,
                      ))),
              CustomListTile("Editar Minhas Informações", Icons.business,
                  "editar", context),
              CustomListTile("Sobre", Icons.info, "sobre", context),
              CustomListTile("Logout", Icons.lock, "logout", context)
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: GridView.builder(
              itemCount: controller.services().length,
              gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.0),
              )),
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation(
                  1.2,
                  Card(
                    child: InkWell(
                      onTap: () {
                        if (index == 0)
                          Navigator.pushNamed(context, 'home/qrcode');
                        else if (index == 1)
                          Navigator.pushNamed(context, 'home/dashboard');
                        else if (index == 2)
                          Navigator.pushNamed(context, 'home/fornecedor');
                        else if (index == 3)
                          Navigator.pushNamed(context, 'home/lancamentos');
                      },
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Image.asset(controller.images()[index],
                              height: 50, width: 50),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              controller.services()[index],
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }

  CustomListTile(
      String texto, IconData icon, String pagina, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {
            if (pagina == "editar") {}
            if (pagina == "logout") {
              controller.logoff();
            }
            if (pagina == "sobre") {
              Navigator.pushNamed(context, 'home/sobre');
            }
          },
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.deepPurple,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(texto,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple)),
                  ),
                ]),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
