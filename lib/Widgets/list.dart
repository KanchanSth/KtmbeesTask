import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/Model/db_model.dart';
import 'package:todoapp/Screen/todoui.dart';

class CustomList extends StatefulWidget {
  final String taskName;
  final String? description;
  final int id;
  final Function() onClicked;

  const CustomList({
    Key? key,
    required this.taskName,
    required this.id,
    required this.onClicked,
    this.description,
  }) : super(key: key);

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  List<Map<String, dynamic>> toDoList = [];

  bool? taskCompleted = false;

  final TextDecoration textDecoration = TextDecoration.lineThrough;
  final addTaskController = TextEditingController();

  Future<void> _deleteItem(int id) async {
    await DbHelper.deleteItem(id);
    final data = await DbHelper.getItems();
    setState(() {
      toDoList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 5, top: 20, right: 5),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  _deleteItem(widget.id);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Homepage()),
                    (route) => false,
                  );
                },
                icon: Icons.delete,
                backgroundColor: const Color.fromARGB(255, 255, 0, 0),
              ),
            ],
          ),
          child: Material(
            elevation: 5.0,
            shadowColor: Colors.blueAccent,
            child: ListTile(
              tileColor: Colors.white,
              leading: Checkbox(
                  activeColor: Colors.green,
                  value: taskCompleted,
                  onChanged: (bool? value) {
                    setState(() {
                      taskCompleted = value;
                    });
                  }),
              title: Text(
                widget.taskName,
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 0.5,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    decoration: taskCompleted!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              subtitle: Text(
                widget.description!,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 0.5,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    decoration: taskCompleted!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              trailing: IconButton(
                onPressed: widget.onClicked,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ));
  }
}
