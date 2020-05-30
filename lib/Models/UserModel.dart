class UserModel{
  String _email;
  String _password;
  String _confirmPassword;

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get confirmPassword => _confirmPassword;

  set confirmPassword(String value) {
    _confirmPassword = value;
  }



}