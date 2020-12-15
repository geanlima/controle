import 'package:controle/pages/home_page.dart';
import 'package:controle/pages/pessoa_page.dart';
import 'package:controle/utils/nav.dart';
import 'package:controle/widgets/app_button.dart';
import 'package:controle/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controle Financeiro"),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              AppText(
                "Login",
                "Digite o Login",
                controller: _tLogin,
                validator: _validateLogin,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 10),
              AppText("Senha", "Digite a Senha",
                  password: true,
                  controller: _tSenha,
                  validator: _validateSenha,
                  keyboardType: TextInputType.number),
              SizedBox(height: 20),
              AppButton("Login", "RaisedButton", _onClickLogin, showProgress: false),
              SizedBox(height: 15),
              AppButton("Registrar?", "Hiperlink", _onClickRegistrar, showProgress: false,),
            ],
          ),
        ),
      ),
    );
  }

  void _onClickRegistrar() {
    push(context, PessoaPage());
  }

  void _onClickLogin() {
    bool formOk = _formkey.currentState.validate();

    if (!formOk) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    push(context, HomePage());

    print("Login $login Senha $senha");
  }

  String _validateLogin(String value) {
    if (value.isEmpty) {
      return "Digite o Login";
    }
    return null;
  }

  String _validateSenha(String value) {
    if (value.isEmpty) {
      return "Digite a Senha";
    }
    if (value.length < 3) {
      return "A senha deve ter pelo menos 3 numeros";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
