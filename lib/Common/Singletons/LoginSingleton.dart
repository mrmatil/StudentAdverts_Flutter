class LoginSingleton {
  static final LoginSingleton _singleton = LoginSingleton._internal();

  factory LoginSingleton() {
    return _singleton;
  }

  LoginSingleton._internal();

  //Variables
  String login;
  String password;
  String rePassword;



}