import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:todo/ui/widgits/CompletedListwidget.dart';

import 'widgits/AddToDoDialog.dart';
import 'widgits/TodoListWidgit.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    final tabs=[
      TodoListWidgit(),
      CompletedListwidget(),
    ];
    return Scaffold(
      appBar: AppBar(
      title: Text(MyApp.title),
    ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedindex,
        onTap: (index)=>setState((){
          selectedindex=index;
        }),
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.fact_check_outlined),
          label: 'Todos',
          ),
          BottomNavigationBarItem(icon:Icon(Icons.done),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedindex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.add),
        onPressed: () =>showDialog(
            builder: (context) => AddToDoDialogWidgit(), context: context,
          barrierDismissible: false,
        ),


        backgroundColor: Colors.greenAccent,
      ),

    );
  }
}

