import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/todos.dart';
import 'TodoWidgit.dart';

class TodoListWidgit extends StatelessWidget {
  const TodoListWidgit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final provider=Provider.of<TodosProvider>(context);
    final todos=provider.todos;
    return todos.isEmpty
      ? Center(child: Text("No ",style: TextStyle(fontSize: 45),),)
    : ListView.separated(

      padding: EdgeInsets.all(16),
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context,index)=>Container(height: 26,),
      itemCount: todos.length,
      itemBuilder: (context,index){
        final todo=todos[index];
        return TodoWidgit( todo: todo);
      },
    );
  }
}


