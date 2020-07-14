import 'dart:convert';
import 'package:cars/pages/user.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<User> login(String login, String senha) async {
  
    var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

    Map<String, String> headers = {
      "Content-type": "application/json"
    };

    Map params = {
      'username': login, 
      'password': senha,
    };

    String s = json.encode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);

    final user = User.fromJson(mapResponse);

    return user;
  }
}