import 'package:flutter/material.dart';
import 'package:todoapp/Model/db_model.dart';
import 'package:todoapp/Model/todo_model.dart';
import 'package:todoapp/Screen/home_screen.dart';

class AddUpdateTask extends StatefulWidget {
  int? selectedId;

  AddUpdateTask({super.key, required this.selectedId});

  @override
  State<AddUpdateTask> createState() => _AddUpdateTaskState();
}

class _AddUpdateTaskState extends State<AddUpdateTask> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: titleController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Title here"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Title is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          minLines: 5,
                          controller: descController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Description here"),
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "Description is required";
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: Color.fromARGB(255, 38, 202, 43),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.selectedId != null
                                ? await DatabaseHelper.instance.update(
                                    ToDoModel(
                                        id: widget.selectedId,
                                        title: titleController.text,
                                        desc: descController.text),
                                  )
                                : await DatabaseHelper.instance.add(
                                    ToDoModel(
                                        title: titleController.text,
                                        desc: descController.text),
                                  );
                            setState(() {
                              titleController.clear();
                              descController.clear();
                              widget.selectedId = null;
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UI(),
                                ));
                            titleController.clear();
                            descController.clear();

                            print("Data added");
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 55,
                          width: 120,
                          decoration: const BoxDecoration(),
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            titleController.clear();
                            descController.clear();
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 55,
                          width: 120,
                          child: const Text(
                            "Clear",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
