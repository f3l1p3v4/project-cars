import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          TextFormField(
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
            decoration: InputDecoration(
              labelText: "Login",
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey
              ),
              hintText: "Digite seu Login"
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Senha",
              hintText: "Digite sua senha"
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 58,
            child: RaisedButton(
              color: Colors.deepPurple,
              child: Text("Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}