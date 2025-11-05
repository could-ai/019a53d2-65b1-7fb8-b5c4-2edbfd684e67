class Workspace {
  final String id;
  final String name;
  final List<Board> boards;

  Workspace({required this.id, required this.name, required this.boards});

  factory Workspace.fromJson(Map<String, dynamic> json) {
    return Workspace(
      id: json['id'],
      name: json['name'],
      boards: (json['boards'] as List).map((b) => Board.fromJson(b)).toList(),
    );
  }
}

class Board {
  final String id;
  final String name;
  final List<Task> tasks;

  Board({required this.id, required this.name, required this.tasks});

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      id: json['id'],
      name: json['name'],
      tasks: (json['tasks'] as List).map((t) => Task.fromJson(t)).toList(),
    );
  }
}

class Task {
  final String id;
  final String title;
  final String description;
  final String status;
  final DateTime? dueDate;
  final List<String> assignees;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    this.dueDate,
    required this.assignees,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      assignees: List<String>.from(json['assignees']),
    );
  }
}