import 'package:flutter/material.dart';

import '../model/todo.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late final TextEditingController _todoController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _todoController = TextEditingController();
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _todoController,
                decoration: const InputDecoration(
                  hintText: "todo title",
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Todo todo = Todo(
                        id: DateTime.now().millisecondsSinceEpoch,
                        title: _todoController.text,
                        isCompleted: false,
                      );

                      Navigator.of(context).pop(todo);
                    }
                  },
                  child: const Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
