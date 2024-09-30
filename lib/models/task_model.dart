class Task {
  String name;
  String description;
  bool isCompleted;

  Task({required this.name, required this.description, this.isCompleted = false});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }
}
