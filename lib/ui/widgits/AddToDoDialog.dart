import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/todos.dart';
import 'package:todo/ui/widgits/todoformwidget.dart';

import '../Todo.dart';

class AddToDoDialogWidgit extends StatefulWidget {
  const AddToDoDialogWidgit({Key? key}) : super(key: key);

  @override
  State<AddToDoDialogWidgit> createState() => _AddToDoDialogWidgitState();
}

class _AddToDoDialogWidgitState extends State<AddToDoDialogWidgit> {
  @override
  final _formKey=GlobalKey<FormState>();
  String title='';
  String description="";
  Widget build(BuildContext context) => AlertDialog(
    content:Form(
      key: _formKey,
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'add to do',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),
          ),
          const SizedBox(height: 8,),
          TodoFormWidget(
            onChangedDescription: (descreption)=>setState(()=>this.description=descreption),
            onChangedTitle: (title)=>setState(()=>this.title=title),
            onSavedTodo: addTodo,)
        ],
      ),
    )
  );
  void addTodo(){
    final isValid=_formKey.currentState!.validate();
    if(isValid==false){
      return;
    }else{
      final todo=Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime:  DateTime.now(),
      );
      final provider = Provider.of<TodosProvider>(context,listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }

  }
}
