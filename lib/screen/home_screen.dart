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
      body: todos.isEmpty
          ? const Center(
              child: Text(
                'Make some todos..',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 180, 130, 189),
                ),
              ),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  todo: todos[index],
                  onDelete: (id) {
                    setState(() {
                      todos.removeWhere((element) => element.id == id);
                    });
                  },
                  onToggle: (id) {
                    setState(() {
                      Todo todo =
                          todos.firstWhere((element) => element.id == id);
                      todo.isCompleted = !todo.isCompleted;
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
