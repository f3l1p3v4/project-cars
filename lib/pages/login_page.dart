import 'package:cars/widgets/app_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
            _input(
              "E-mail*", 
              "Digite seu email", 
              controller: _tLogin, 
              validator: 
              _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
              SizedBox(height: 10,),
              _input(
                "Senha*", 
                "Digite sua senha", 
                password: true, 
                controller: _tSenha, 
                validator: _validateSenha,
                keyboardType: TextInputType.number,
                focusNode: _focusSenha
              ),
              SizedBox(height: 20,),
              AppButton(
                "Entrar", 
                onPressed: _onClickLogin,
              ),
            ],
          ),
        ),
      );
    }

  _input(
    String label, 
    String hint, { 
      bool password = false, 
      TextEditingController controller, 
      FormFieldValidator<String> validator,
      TextInputType keyboardType,
      TextInputAction textInputAction,
      FocusNode focusNode,
      FocusNode nextFocus,
    }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if(nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
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

  void _onClickLogin() {

    if(!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("$login, $senha");
  }

  String _validateLogin(String text) {
    if(text.isEmpty) {
    return "Digite o email";
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

  @override
  void dispose() {
    super.dispose();
  }
}