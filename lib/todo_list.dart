import 'package:flutter/material.dart';
import 'db_model.dart';
import 'todo_cart.dart';

class Todolist extends StatelessWidget {

  final Function insertFunction;
  final Function deleteFunction;
  final db = DatabaseConnect();

  Todolist({required this.insertFunction, required this.deleteFunction,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snaphot)
        {
          var data = snaphot.data;
          var datalength = data!.length;

          return datalength == 0 ? const Center(child: Text("No data found"),)
              :ListView.builder(itemCount: datalength, itemBuilder: (context,i) => Todocart(
              id: data[i].id,
              title: data[i].title,
              creationDate: data[i].creationDate,
              isChecked: data[i].isChecked,
              deleteFunction: insertFunction,
              insertFunction: deleteFunction,
          ),);
        },
      ),
    );
  }
}
