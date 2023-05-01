class ToDo {
  String? title;
  String? description;
  bool isChecked;

  ToDo({this.description, this.isChecked = false, required this.title});

  static List<ToDo> todoList() {
    return [
      ToDo(title: "Jogging", description: "Jogging", isChecked: true),
      ToDo(
          title: "Grocery Shopping",
          description: "Grocery Shopping",
          isChecked: false),
      ToDo(title: "Meeting", description: "Meeting", isChecked: true),
      ToDo(title: "Dinner", description: "Dinner", isChecked: true),
      ToDo(
          title: "Get new task", description: "Get new task", isChecked: false),
    ];
  }
}
