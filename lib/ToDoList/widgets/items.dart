import 'package:flutter/material.dart';
import 'package:tasks2/ToDoList/Model/todolist.dart';

class Items extends StatelessWidget {
  final ToDo toDo;
  const Items({super.key, required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
          toDo.isChecked ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
        ),
        title: Text(
          toDo.title!,
          style: TextStyle(
              decoration: toDo.isChecked ? TextDecoration.lineThrough : null),
        ),
        subtitle: Text(toDo.description!),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }
}
