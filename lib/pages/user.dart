class User {
  String login;
  String name;
  String email;
  String token;

  List<String> roles;

  User.fromJson(Map<String,dynamic> map) :
    this.login = map["login"],
    this.name = map["nome"],
    this.email = map["email"],  
    this.token = map["token"],  
    this.roles = map["roles"];  

  @override
  String toString() {
    return 'User(login: $login, name: $name, E-mail: $email, token: $token)';
  }
}