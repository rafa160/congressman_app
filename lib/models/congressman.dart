import 'dart:convert';

import 'package:new_congressman_app/models/congressman_data.dart';

Congressman congressmanFromJson(String str) => Congressman.fromJson(json.decode(str));

String congressmanToJson(Congressman data) => json.encode(data.toJson());

class Congressman {

  List<CongressmanData> data;

  Congressman({this.data});

  factory Congressman.fromJson(Map<String, dynamic> json) => Congressman(
    data: List<CongressmanData>.from(json["dados"].map((e) => CongressmanData.fromJson(e))),
  );

  Map<String, dynamic> toJson() => {
    "dados": List<dynamic>.from(data.map((e) => e.toJson()))
  };

  @override
  String toString() {
    // TODO: implement toString
    return 'Congressman{dados: $data}';
  }


}