import 'package:flutter/material.dart';
import 'package:tasks2/ToDoList/Model/todolist.dart';
import 'package:tasks2/ToDoList/widgets/items.dart';

class ToDoUI extends StatefulWidget {
  const ToDoUI({super.key});

  @override
  State<ToDoUI> createState() => _ToDoUIState();
}

class _ToDoUIState extends State<ToDoUI> {
  final todoList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
      ),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              for (ToDo todo in todoList)
                Items(
                  toDo: todo,
                  onChange: handleChanges,
                  onDelete: () {},
                )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  void handleChanges(ToDo toDo) {
    setState(() {
      toDo.isChecked = !toDo.isChecked;
    });
  }
}
