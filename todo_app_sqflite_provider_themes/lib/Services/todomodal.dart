class ToDoModal {
  int? id;
  String? todo;
  int? isDone;

  ToDoModal({this.id, this.todo, this.isDone});

  ToDoModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['todo'] = todo;
    data['isDone'] = isDone;
    return data;
  }
}
