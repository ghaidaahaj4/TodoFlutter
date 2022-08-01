import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/ui/Utils.dart';

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