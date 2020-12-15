import 'dart:io';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:controle/classes/pessoa.dart';
import 'package:controle/widgets/app_button.dart';
import 'package:controle/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PessoaPage extends StatefulWidget {
  final Pessoa pessoa;

  PessoaPage({this.pessoa});

  @override
  _PessoaPageState createState() => _PessoaPageState();
}

class _PessoaPageState extends State<PessoaPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final tNome = TextEditingController();
  final tFoto = TextEditingController();
  final tTelefone = TextEditingController();
  final tEmail = TextEditingController();
  final tTipo = TextEditingController();

  int _radioIndex = 0;
  File _file = null;
  var _showProgress = false;

  Pessoa get pessoa => widget.pessoa;

  String _validateNome(String value) {
    if (value.isEmpty) {
      return 'Informe o nome da Pessoa.';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Pessoa"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _form(),
      ),
    );
  }

  Form _form() {
    return Form(
      key: this._formKey,
      child: ListView(
        children: [
          _headerFoto(),
          Text(
            "Clique na imagem para tirar uma foto",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
          Divider(),
          AppText(
            "Nome",
            "",
            controller: tNome,
            keyboardType: TextInputType.text,
            validator: _validateNome,
          ),
          Divider(),
          AppText(
            "Telefone",
            "",
            controller: tTelefone,
            keyboardType: TextInputType.phone,
            validator: _validateNome,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter(),
            ]
          ),
          Divider(),
          AppText(
            "Email",
            "",
            controller: tEmail,
            keyboardType: TextInputType.emailAddress,
            validator: _validateNome,
          ),
          Divider(),
          _radioTipo(),
          Divider(),
          AppButton(
            "Salvar",
            "RaisedButton",
            _onClickSalvar,
            showProgress: false,
          ),
        ],
      ),
    );
  }

  _onClickSalvar() {}

  _radioTipo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 0,
          groupValue: _radioIndex,
          onChanged: _onClickTipo,
        ),
        Text(
          "Credor",
          style: TextStyle(color: Colors.blue, fontSize: 18),
        ),
        Radio(
          value: 1,
          groupValue: _radioIndex,
          onChanged: _onClickTipo,
        ),
        Text(
          "Devedor",
          style: TextStyle(color: Colors.blue, fontSize: 18),
        ),
        Radio(
          value: 2,
          groupValue: _radioIndex,
          onChanged: _onClickTipo,
        ),
        Text(
          "Usuário",
          style: TextStyle(color: Colors.blue, fontSize: 18),
        ),
      ],
    );
  }

  void _onClickTipo(int value) {
    setState(() {
      _radioIndex = value;
    });
  }

  _headerFoto() {
    return InkWell(
      onTap: _onClickFoto,
      child: _file != null
          ? Image.file(
              _file,
              height: 150,
            )
          : pessoa != null
              ? CachedNetworkImage(
                  imageUrl: pessoa.Foto,
                )
              : Image.asset(
                  "assets/images/camera.png",
                  height: 150,
                ),
    );
  }

  void _onClickFoto() async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        this._file = file;
      });
    }
  }
}
