import 'dart:convert';

LoguinModel userFromMap(String str) => LoguinModel.fromMap(json.decode(str));

String userToMap(LoguinModel data) => json.encode(data.toMap());

class LoguinModel {
  LoguinModel({
    required this.name,
    required this.mail,
    required this.password,
    required this.keepn,
  });

  final String name;
  final String mail;
  final String password;
  final bool keepn;

  factory LoguinModel.fromMap(Map<String, dynamic> json) => LoguinModel(
        name: json["name "],
        mail: json["mail"],
        password: json["password"],
        keepn: json["keepün"],
      );

  Map<String, dynamic> toMap() => {
        "name ": name,
        "mail": mail,
        "password": password,
        "keepün": keepn,
      };

  @override
  String toString() {
    return "name: " + name + "\nE-mail" + mail + "\nPassword" + password;
  }

  Object toJson() {
    return toJson();
  }
}
