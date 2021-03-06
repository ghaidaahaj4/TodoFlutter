
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../EditTodoPage.dart';
import '../Todo.dart';
import '../Utils.dart';
import '../todos.dart';

class TodoWidgit extends StatelessWidget {

  final Todo todo;
  const TodoWidgit(
      {Key? key,
        required this.todo
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Slidable(

        endActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          // A pane can dismiss the Slidable.
          // dismissible: DismissiblePane(onDismissed: () {}),
          // All actions are defined in the children parameter.
          children:  [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context )=>deleteTodo(context, todo),
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),

          ],
        ),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          //dismissible: DismissiblePane(onDismissed: () {}),
          children:  [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 2,
              onPressed:(context)=>editTodo(context,todo),
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'edit',
            ),

          ],
        ),

        child: buildTodo(context),
        key: Key(todo.id),
      ),
    );

  }
  Widget buildTodo(BuildContext context)=>GestureDetector(
    onTap: ()=>editTodo(context,todo),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(

        children: [
          Checkbox(
            activeColor: Colors.blueAccent,
            checkColor: Colors.black,
            value: todo.isDone,
            onChanged: (_){
              final provider = Provider.of<TodosProvider>(context, listen: false);
              final isDone= provider.toggleTodoStatus(todo);
              Utils.showSnackBar(context,isDone? 'task completed': 'task uncomplete');
            },
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontSize: 20,
                  ),
                ),
                if(todo.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todo.description,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.5,
                        fontSize: 12,
                      ),


                    ),
                  ),
              ],
            ),
          )

        ],
      ),
    ),
  );



}
editTodo(BuildContext context, Todo todo) =>Navigator.of(context).push(
  MaterialPageRoute(
      builder: (context)=>EditTodoPage(todo: todo),
  ),
);


void deleteTodo(BuildContext context, Todo todo) {
  final provider = Provider.of<TodosProvider>(context, listen: false);
  provider.removeTodo(todo);
  Utils.showSnackBar(context, "Deleted the task");

}
void doNothing(BuildContext context){}