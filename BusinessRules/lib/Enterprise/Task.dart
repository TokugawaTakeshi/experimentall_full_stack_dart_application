class Task {

  String title;
  String? description;
  bool isDone;


  Task({
    required String this.title,
    String? this.description,
    bool this.isDone = false
  });
}
