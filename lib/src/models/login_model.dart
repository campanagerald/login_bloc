class LoginModel {
  String _email;
  String _password;

  LoginModel(this._email, this._password);

  LoginModel copyWith({String email, String password}) {
    return new LoginModel(
      email ?? this._email,
      password ?? this._password,
    );
  }

  String get email => _email;
  String get password => _password;

  set setEmail(String newEmail) {
    _email = newEmail;
  }

  set setPassword(String newPassword) {
    _password = newPassword;
  }

  @override
  String toString() {
    return '''
    Email: $_email
    Password: $_password
    ''';
  }
}
