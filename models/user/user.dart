class User {
  String _email;
  String _password;

  User(this._email, this._password);

  // getter
  String get email => _email;
  String get password => _password;

  bool login(String email, String password) {
    return _email == email && _password == password;
  }

  void showDetails() {
    print("Email: $_email");
  }

  // fromjson
  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['email'], json['password']);
  }
}
