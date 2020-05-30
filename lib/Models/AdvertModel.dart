class AdvertModel{
  int _id;
  String _title;
  String _author;
  String _email;
  int _phone;
  DateTime _dateTime;
  String _description;
  double _price;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get title => _title;

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;
  }

  int get phone => _phone;

  set phone(int value) {
    _phone = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  set title(String value) {
    _title = value;
  }
}
