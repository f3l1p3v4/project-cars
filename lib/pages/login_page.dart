import 'package:cars/pages/home_page.dart';
import 'package:cars/pages/login_api.dart';
import 'package:cars/pages/user.dart';
import 'package:cars/utils/nav.dart';
import 'package:cars/widgets/app_button.dart';
import 'package:cars/widgets/app_text.dart';
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
            AppText(
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
            AppText(
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

  void _onClickLogin() async {

    if(!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("$login, $senha");

    User user = await LoginApi.login(login, senha);

    if(user != null) { 
      print(user);
      push(context, HomePage());
    } else {
      print("Login incorreto");
    }
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
    if(text.length < 3) {
      return "A senha precisa ter pelo menos 6 números";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}