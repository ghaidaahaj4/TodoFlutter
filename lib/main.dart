import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/HomePage.dart';
import 'package:todo/ui/todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = "t";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TodosProvider(),
      child : MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.green[100]
      ),
        home: HomePage(),
    ),
    );
  }
}
