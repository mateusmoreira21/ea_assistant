import 'package:ea_assistant/app/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'reset_controller.dart';

class ResetPage extends StatefulWidget {
  final String title;
  const ResetPage({Key key, this.title = "Reset"}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends ModularState<ResetPage, ResetController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 100,
                  left: 32,
                  child: FadeAnimation(
                    1.1,
                    Text(
                      'Recupere sua conta',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: 190,
                  child: Container(
                    padding: EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(62),
                            topRight: Radius.circular(62))),
                    child: FadeAnimation(
                      1.2,
                      Form(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.lock,
                              color: Colors.deepPurple,
                              size: 150,
                            ),
                            TextField(
                              onChanged: controller.changeEmailUser,
                              decoration: InputDecoration(
                                hintText: 'E-mail',
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 16,
                              ),
                            ),
                            Builder(
                              builder: (context) => MaterialButton(
                                child: Container(
                                  height: 45,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'ENVIAR',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  controller.resetPass(context);
                                },
                              ),
                            ),
                            Container(
                              height: 8,
                            ),
                            Container(
                              height: 70,
                            ),
                            Container(
                              height: 45,
                              width: 170,
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                              child: MaterialButton(
                                child: Center(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.arrow_back),
                                      Text(
                                        'Voltar para login',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  Modular.to.pushReplacementNamed('/login');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
