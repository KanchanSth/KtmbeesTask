import 'package:flutter/material.dart';
import 'package:todoapp/Model/db_model.dart';
import 'package:todoapp/Widgets/button.dart';
import 'package:todoapp/Widgets/list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> toDoList = [];

  final _formKey = GlobalKey<FormState>();

  int? taskLength;

  retrieveItemsFromDatabase() async {
    final data = await DbHelper.getItems();
    setState(() {
      toDoList = data;
      taskLength = toDoList.length;
    });
  }

  final addTaskController = TextEditingController();
  final addDescriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    retrieveItemsFromDatabase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          "TO DO",
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          taskLength == 0 || taskLength == null
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                      child: Text(
                    "No Task Found !!!",
                    style: TextStyle(fontSize: 25),
                  )),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: toDoList.length,
                  itemBuilder: (context, index) {
                    return CustomList(
                      taskName: toDoList[index]['title'],
                      description: toDoList[index]['description'] ?? '',
                      id: toDoList[index]['id'],
                      onClicked: () async {
                        await createNewTask(toDoList[index]['id']);
                      },
                    );
                  },
                ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: FloatingActionButton(
          onPressed: () {
            createNewTask(null);
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            size: 30,
            color: Color.fromARGB(255, 21, 103, 171),
          ),
        ),
      ),
    );
  }

  Future<void> _updateItem(int id) async {
    await DbHelper.updateItem(
        id, addTaskController.text, addDescriptionController.text);
    retrieveItemsFromDatabase();
  }

  Future<void> _addItem() async {
    await DbHelper.createItem(
        addTaskController.text, addDescriptionController.text);
    retrieveItemsFromDatabase();
  }

  createNewTask(int? id) async {
    if (id != null) {
      final existingList =
          toDoList.firstWhere((element) => element['id'] == id);
      addTaskController.text = existingList['title'];
      addDescriptionController.text = existingList['description'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Please enter the task';
                        }
                      },
                      controller: addTaskController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 5, color: Colors.black)),
                          hintText: 'Title'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Please enter the task description';
                        }
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: null,
                      controller: addDescriptionController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 5, color: Colors.black)),
                          hintText: 'Description'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          text: (id == null) ? "Save" : "Update",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (id == null) {
                                await _addItem();
                              }
                              if (id != null) {
                                await _updateItem(id);
                              }

                              addTaskController.text = '';
                              addDescriptionController.text = '';

                              Navigator.of(context).pop();
                            }
                            ;
                          },
                          color: id == null
                              ? Color.fromARGB(255, 22, 173, 27)
                              : Colors.blue,
                        ),
                        Button(
                          text: "Cancel",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Homepage(),
                                ));
                          },
                          color: Color.fromARGB(255, 232, 35, 35),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
