
import 'package:flutter/material.dart';

import 'Todo.dart';

class TodosProvider extends ChangeNotifier{
   List<Todo> _todos=[
    Todo(createdTime: DateTime.now(),title: "walk the dog", id:"1"),
    Todo(createdTime: DateTime.now(),title: "walk theeee dog", id:"2",description: "hhhh"),
     Todo(createdTime: DateTime.now(),title: "walk the dog", id:"3"),
     Todo(createdTime: DateTime.now(),title: "walk theeee dog", id:"4",description: "hhhh"),
     Todo(createdTime: DateTime.now(),title: "walk the dog", id:"5"),
     Todo(createdTime: DateTime.now(),title: "walk theeee dog", id:"6",description: "hhhh"),
     Todo(createdTime: DateTime.now(),title: "walk the dog", id:"7"),
     Todo(createdTime: DateTime.now(),title: "walk theeee dog", id:"8",description: "hhhh"),
  ];

   List<Todo> get todos => _todos.where((todo) => todo.isDone==false).toList();
}