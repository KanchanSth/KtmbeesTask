class ToDoModel {
  final int? id;
  final String title;
  final String desc;
  // final bool? isChecked;

  ToDoModel(
      {this.id,
      required this.title,
      required this.desc,
      });

  factory ToDoModel.fromMap(Map<String, dynamic> json) => new ToDoModel(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      );

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': title, 'desc': desc};
  }
}
