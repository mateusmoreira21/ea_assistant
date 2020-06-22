import 'package:ea_assistant/app/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  final String title;
  const SignupPage({Key key, this.title = "Crie sua conta"}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  //use 'controller' variable to access controller
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.deepPurple,
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 100,
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
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              // observer do Nome
                              Observer(builder: (_) {
                                return TextFormField(
                                  onChanged: controller.changeName,
                                  decoration: InputDecoration(
                                      labelText: 'Nome Completo',
                                      prefixIcon: Icon(Icons.list),
                                      errorText: controller.validateName()),
                                );
                              }),

                              SizedBox(
                                height: 10,
                              ),
                              // observer do email
                              Observer(builder: (_) {
                                return TextFormField(
                                  onChanged: controller.changeEmail,
                                  decoration: InputDecoration(
                                      labelText: 'E-mail',
                                      prefixIcon: Icon(Icons.email),
                                      errorText: controller.validateEmail()),
                                  keyboardType: TextInputType.emailAddress,
                                );
                              }),

                              SizedBox(
                                height: 10,
                              ),

                              Observer(builder: (_) {
                                return TextFormField(
                                  onChanged: controller.changePass,
                                  obscureText:
                                      _showPassword == false ? true : false,
                                  decoration: InputDecoration(
                                    labelText: 'Senha',
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
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                );
                              }),

                              SizedBox(
                                height: 10,
                              ),

                              Observer(builder: (_) {
                                return TextFormField(
                                  onChanged: controller.changePass2,
                                  obscureText:
                                      _showPassword == false ? true : false,
                                  decoration: InputDecoration(
                                    labelText: 'Senha',
                                    errorText: controller.validatePass(),
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
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                );
                              }),

                              SizedBox(height: 80),

                              Observer(builder: (_) {
                                return Container(
                                  height: 45,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32)),
                                  ),
                                  child: MaterialButton(
                                    onPressed: controller.validateButtom
                                        ? () {
                                            controller.signUp();
                                            Modular.to
                                                .pushReplacementNamed('/login');
                                          }
                                        : null,
                                    disabledColor: Colors.grey,
                                    child: Text(
                                      'CADASTRAR',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              }),

                              Container(
                                height: 70,
                              ),
                              Container(
                                height: 45,
                                width: 190,
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
                                          '\tVoltar para login',
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
                        )),
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
