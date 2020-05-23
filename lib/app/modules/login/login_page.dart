import 'package:ea_assistant/app/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool _showPassword = false;

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.deepPurple[900],
        Colors.deepPurple[800],
        Colors.deepPurple[400]
      ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Form(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FadeAnimation(
                                1.3,
                                Center(
                                  child: Image.asset(
                                    'lib/app/images/logo.png',
                                    height: 140,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                          1.4,
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.email),
                                        hintText: "Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (text) {
                                      if (text.isEmpty || !text.contains("@"))
                                        return "E-mail inválido!";
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      hintText: "Senha",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      suffixIcon: GestureDetector(
                                        child: Icon(_showPassword == false
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onTap: () {
                                          setState(() {
                                            _showPassword = !_showPassword;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText:
                                        _showPassword == false ? true : false,
                                    validator: (text) {
                                      if (text.isEmpty || text.length < 6)
                                        return "Senha Invalida";
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.40,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FadeAnimation(
                              1.5,
                              FlatButton(
                                child: Text(
                                  "Esqueceu a senha?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  // Recuperar a senha
                                },
                                padding: EdgeInsets.zero,
                              )),
                        ),
                        SizedBox(
                          height: 0.40,
                        ),
                        FadeAnimation(
                            1.6,
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.deepPurple[900]),
                              child: Builder(
                                builder: (context) => MaterialButton(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text("Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center),
                                  ),
                                  onPressed: () {
                                    // Função Login E-mail/Senha
                                  },
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        FadeAnimation(
                            1.7,
                            Text(
                              "Entre com as redes sociais",
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FadeAnimation(
                                  1.8,
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.blue),
                                    child: FlatButton(
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text("Facebook",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center),
                                      ),
                                      onPressed: () {},
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: FadeAnimation(
                                  1.8,
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white),
                                    child: FlatButton(
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text("Google",
                                            style: TextStyle(
                                              color: Colors.redAccent[700],
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center),
                                      ),
                                      onPressed: () {
                                        controller.loginWithGoogle();
                                      },
                                    ),
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                          1.9,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Não Possui uma conta?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              FlatButton(
                                child: Text(
                                  "Crie Agora",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900),
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login/signup');
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
