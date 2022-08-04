import 'package:flutter/material.dart';

class Transactions{
  String id;
  String title ;
  double amount;
  DateTime dateTime;

  Transactions({
    required this.id,
    required this.title,
    required this.amount,
    required this.dateTime});

}