import 'package:flutter/material.dart';
import 'package:to_do_app/todo_model.dart';
import 'db_model.dart';
import 'todo_list.dart';
import 'user_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var db = DatabaseConnect();

  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {

    });
    }

  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Todo App'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          Todolist(insertFunction: addItem, deleteFunction: deleteItem),
          UserInput(insertFunction: addItem)
        ],
      )
    );
  }
}
