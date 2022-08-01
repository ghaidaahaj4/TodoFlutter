import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title ;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget(
      {Key? key,
        this.title='',
        this.description="",
        required this.onChangedDescription,
        required this.onChangedTitle,
        required this.onSavedTodo,

      }) : super(key: key);

  @override
  Widget build(BuildContext context) =>SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        const SizedBox(height: 8,),
        buildDescription(),
        const SizedBox(height: 15,),
        buildButton(),
      ],
    ),
  );

  Widget buildTitle()=>TextFormField(
    maxLines: 1,
    initialValue: this.title,
    onChanged: onChangedTitle,
    validator: (title){
      if(title==""){
        return 'The Title cannot be Empty';
      }
      return null;
    },
    decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Title', ),
  );



  Widget buildDescription()=>TextFormField(
    maxLines:3,
    initialValue: this.description,
    onChanged: onChangedDescription,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Description', ),
  );
  Widget buildButton()=>SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onSavedTodo,
      child: Text("saaveee!"),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.teal),
    ),

  ),);
}
