class Todo {
  final String id;
  final String description;

  Todo({
    required this.id,
    required this.description,
  });
  factory Todo.fromJson(Map json) {
    return Todo(
      id: json['id'],
      description: json['description'],
    );
  }
  Map toMap() {
    return {
      'id': this.id,
      'description': this.description,
    };
  }
}
