import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_viewmodels.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoViewModel = context.watch<TodoViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: todoViewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: todoViewModel.todos.length,
        itemBuilder: (context, index) {
          final todo = todoViewModel.todos[index];
          return ListTile(
            title: Text(todo.title),
            trailing: Icon(
              todo.completed ? Icons.check_circle : Icons.circle,
              color: todo.completed ? Colors.green : Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoViewModel.fetchTodos();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
