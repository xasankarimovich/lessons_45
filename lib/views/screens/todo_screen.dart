import 'package:flutter/material.dart';

import '../../notifiers/todo_notifier.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoViewModel = TodoInheritedWidget.of(context)!.viewModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: todoViewModel,
              builder: (context, child) {
                return ListView.builder(
                  itemCount: todoViewModel.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoViewModel.todos[index];
                    return ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (value) {
                          todoViewModel.toggleTodoStatus(index);
                        },
                      ),
                      onLongPress: () => todoViewModel.removeTodoItem(index),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Add TODO',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      todoViewModel.addTodoItem(_textController.text);
                      _textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}