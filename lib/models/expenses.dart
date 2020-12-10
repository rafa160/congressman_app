import 'package:new_congressman_app/models/expenses_data.dart';
import 'dart:convert';

Expenses expensesFromJson(String str) => Expenses.fromJson(json.decode(str));

String expensesToJson(Expenses data) => json.encode(data.toJson());

class Expenses {

  List<ExpensesData> data;

  Expenses({this.data});

  factory Expenses.fromJson(Map<String, dynamic> json) => Expenses(
    data: List<ExpensesData>.from(json["dados"].map((e) => ExpensesData.fromJson(e))),
  );

  Map<String, dynamic> toJson() => {
    "dados": List<dynamic>.from(data.map((e) => e.toJson()))
  };
}