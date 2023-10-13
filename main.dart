// import 'dart:convert';

import 'datajson.dart';

void main() {

  ///////- from string to json and then : useful in http request
  // Map<String, dynamic> data = json.decode(Data.jsonData);

  //////- direct from json : useful in manually parsing]
  ///
  final data = Data.json;

  List<dynamic> rest = data["data"] as List;

  rest.add({"name":"kavan", "age":70});

  print(rest.map((e) => AppJson.fromJson(e)));

  List<AppJson> list = [];
  list = rest.map<AppJson>((json) => AppJson.fromJson(json)).toList();

  for (int i = 0; i < list.length; i++) {
    if(i==2){
      var name = list[i].name;
      list.removeAt(i);
      list.insert(i, AppJson(name: name, age: 20));
    }
    print("Name : ${list[i].name} - age : ${list[i].age}");
  }
}

class AppJson {
  String? name;
  int? age;

  AppJson({
    required this.name,
    required this.age,
  });

  factory AppJson.fromJson(Map<String, dynamic> json) {
    return AppJson(name: json["name"], age: json["age"]);
  }
}
