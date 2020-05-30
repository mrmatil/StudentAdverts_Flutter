class AdvertJSON {
int id;
String title;
String author;
Null email;
int phone;
String dateAndTime;
String description;
Null price;
Null picture;

AdvertJSON(
    {this.id,
      this.title,
      this.author,
      this.email,
      this.phone,
      this.dateAndTime,
      this.description,
      this.price,
      this.picture});

AdvertJSON.fromJson(Map<String, dynamic> json) {
id = json['id'];
title = json['title'];
author = json['author'];
email = json['email'];
phone = json['phone'];
dateAndTime = json['dateAndTime'];
description = json['description'];
price = json['price'];
picture = json['picture'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['title'] = this.title;
  data['author'] = this.author;
  data['email'] = this.email;
  data['phone'] = this.phone;
  data['dateAndTime'] = this.dateAndTime;
  data['description'] = this.description;
  data['price'] = this.price;
  data['picture'] = this.picture;
  return data;
}
}