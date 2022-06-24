import 'package:flutter/material.dart';

class ToDoFiled{
  static const createdTime='createdTime';
}

class Todo {
  String id;
  DateTime createdTime;
  String title;
  String description;
  bool isDone;

  Todo({
    this.isDone=false,
    required this.createdTime,
    required this.title,
    this.description='',
    required this.id,
});
}