class Todo {
  final int id;
  final String title;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
  });
}

List<Todo> todos = [
  Todo(
    id: 1,
    title: "First Task",
    isCompleted: false,
  ),
  Todo(
    id: 2,
    title: "Second Task",
    isCompleted: true,
  ),
  Todo(
    id: 3,
    title: "Third Task",
    isCompleted: false,
  ),
  Todo(
    id: 4,
    title: "Fourth Task",
    isCompleted: true,
  ),
];
