import 'package:flutter/material.dart';
import 'package:to_do_app/todo_model.dart';

class Todocart extends StatefulWidget {

  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;

  Todocart({required this.id,required this.title,required this.creationDate, required this.isChecked, required this.deleteFunction, required this.insertFunction,Key? key}) : super(key: key);

  @override
  State<Todocart> createState() => _TodocartState();
}

class _TodocartState extends State<Todocart> {
  @override
  Widget build(BuildContext context) {

    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        creationDate: widget.creationDate,
        isChecked: widget.isChecked
    );


    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!;
                });

                anotherTodo.isChecked = value!;
                widget.insertFunction(anotherTodo);


              },
            ),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title),
              SizedBox(height: 5),
              Text(widget.creationDate.toString(),style: const TextStyle(
                fontSize: 16,
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
              ),)],),

          ),
          IconButton(onPressed: () {

            widget.deleteFunction(anotherTodo);
          },
              icon: Icon(Icons.close),
          )
        ],
      ),
    );
  }
}
