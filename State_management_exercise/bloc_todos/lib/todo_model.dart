class ToDo{
  
  final int id;
  final int userId;
  final String title;
  final bool completed;

  const ToDo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        
        'userId': int userId,
        'id': int id,
        'title': String title,
        'completed': bool completed,
      } =>
        ToDo(
          id: id,
          userId: userId,
          title: title,
          completed: completed,
        ),
      _ => throw const FormatException('Failed to load todo.'),
    };
  }
}