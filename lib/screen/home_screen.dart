import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../todo_tile.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoTile(
            todo: todos[index],
            onDelete: (id) {
              setState(() {
                todos.removeWhere((element) => element.id == id);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Todo todo = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddTodoScreen()),
          );

          setState(() {
            todos.add(todo);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
