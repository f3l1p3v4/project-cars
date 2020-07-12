import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _input("Login", "Digite seu login", controller: _tLogin, validator: _validateLogin),
              SizedBox(height: 10,),
              _input("Senha", "Digite sua senha", password: true, controller: _tSenha, validator: _validateSenha),
              SizedBox(height: 20,),
              _button("Entrar", onClickLogin),
            ],
          ),
        ),
      );
    }
            
  _input(String label, String hint, { bool password = false, controller, FormFieldValidator<String> validator }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 20,
          color: Colors.grey
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  _button(String text, Function onPressed) {
    return Container(
      height: 58,
      child: RaisedButton(
        color: Colors.deepPurple,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  void onClickLogin() {

    if(!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("$login, $senha");
  }

  String _validateLogin(String text) {
    if(text.isEmpty) {
    return "Digite o Login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if(text.isEmpty) {
    return "Digite a Senha";
    }
    if(text.length < 6) {
      return "A senha precisa ter pelo menos 6 números";
    }
    return null;
  }
}