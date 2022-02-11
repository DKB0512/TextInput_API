// To parse this JSON data, do
//
//     final textInputBloc = textInputBlocFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

TextInputBloc textInputBlocFromJson(String str) =>
    TextInputBloc.fromJson(json.decode(str));

String textInputBlocToJson(TextInputBloc data) => json.encode(data.toJson());

class TextInputBloc {
  TextInputBloc({
    required this.httpEnWikipediaOrgWiki1,
    required this.httpEnWikipediaOrgWiki2,
    required this.httpEnWikipediaOrgWiki3,
    required this.httpEnWikipediaOrgWiki4,
    required this.httpEnWikipediaOrgWiki5,
    required this.httpEnWikipediaOrgWiki6,
    required this.httpEnWikipediaOrgWiki7,
    required this.httpEnWikipediaOrgWiki8,
    required this.httpEnWikipediaOrgWiki9,
    required this.httpEnWikipediaOrgWiki10,
    required this.success,
  });

  String httpEnWikipediaOrgWiki1;
  String httpEnWikipediaOrgWiki2;
  String httpEnWikipediaOrgWiki3;
  String httpEnWikipediaOrgWiki4;
  String httpEnWikipediaOrgWiki5;
  String httpEnWikipediaOrgWiki6;
  String httpEnWikipediaOrgWiki7;
  String httpEnWikipediaOrgWiki8;
  String httpEnWikipediaOrgWiki9;
  String httpEnWikipediaOrgWiki10;
  int success;

  factory TextInputBloc.fromJson(Map<String, dynamic> json) => TextInputBloc(
        httpEnWikipediaOrgWiki1: json.values.elementAt(0),
        httpEnWikipediaOrgWiki2: json.values.elementAt(1),
        httpEnWikipediaOrgWiki3: json.values.elementAt(2),
        httpEnWikipediaOrgWiki4: json.values.elementAt(3),
        httpEnWikipediaOrgWiki5: json.values.elementAt(4),
        httpEnWikipediaOrgWiki6: json.values.elementAt(5),
        httpEnWikipediaOrgWiki7: json.values.elementAt(6),
        httpEnWikipediaOrgWiki8: json.values.elementAt(7),
        httpEnWikipediaOrgWiki9: json.values.elementAt(8),
        httpEnWikipediaOrgWiki10: json.values.elementAt(9),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        toJson().keys.elementAt(0): httpEnWikipediaOrgWiki1,
        "success": success,
      };
}

class TextInputService {
  Future<TextInputBloc> getTextInputBack(String data, String lang) async {
    final response = await get(Uri.parse(
        'http://api.rest7.com/v1/wikipedia_search.php?text=$data&language=$lang'));
    final textInputBloc = textInputBlocFromJson(response.body);
    print(textInputBloc);
    return textInputBloc;
  }
}
