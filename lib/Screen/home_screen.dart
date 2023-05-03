import 'package:flutter/material.dart';
import 'package:todoapp/Model/db_model.dart';
import 'package:todoapp/Screen/addupdatetask.dart';
import 'package:todoapp/Model/todo_model.dart';

class UI extends StatefulWidget {
  const UI({super.key});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  int? selectedId;
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
      ),
      body: Center(
        child: FutureBuilder<List<ToDoModel>>(
            future: DatabaseHelper.instance.getTasks(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ToDoModel>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? Center(child: Text('No Tasks in List.'))
                  : ListView(
                      children: snapshot.data!.map((toDoModel) {
                        return Center(
                          child: Card(
                            color: selectedId == toDoModel.id
                                ? Colors.white70
                                : Colors.white,
                            child: ListTile(
                              title: Text(toDoModel.title),
                              subtitle: Text(toDoModel.desc),
                              trailing: IconButton(
                                  onPressed: () {
                                    DatabaseHelper.instance
                                        .remove(toDoModel.id!);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                        );
                      }).toList(),
                    );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddUpdateTask(
                        selectedId: selectedId,
                      )));
        },
      ),
    );
  }
}
