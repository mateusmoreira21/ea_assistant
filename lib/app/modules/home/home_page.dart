import 'package:ea_assistant/app/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.clear), onPressed: controller.logoff),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: GridView.builder(
              itemCount: controller.services().length,
              gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.3),
              )),
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation(
                  1.2,
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        if (index == 1)
                          Navigator.pushNamed(context, '/home/fornecedor');
                        else if (index == 3)
                          return 0;
                        // pagina 2
                        else if (index == 0) return 0;
                        // pagina 3
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
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
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
}
