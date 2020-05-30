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
  //TODO: Change these three variables to one but type UserModel, it'll make things simpler later on


}