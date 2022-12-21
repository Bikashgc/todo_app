import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    Key? key,
    required this.todo,
    required this.onDelete,
    required this.onToggle,
  }) : super(key: key);

  final Todo todo;
  final Function(int id) onDelete;
  final Function(int id) onToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: todo.isCompleted,
          onChanged: (value) {
            onToggle(todo.id);
          },
        ),
        const SizedBox(width: 20),
        Expanded(child: Text(todo.title)),
        IconButton(
          onPressed: () {
            onDelete(todo.id);
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
