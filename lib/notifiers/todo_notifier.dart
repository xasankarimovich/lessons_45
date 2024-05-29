import 'package:flutter/material.dart';
import '../controllers/todo_controller.dart';

class TodoInheritedWidget extends InheritedWidget {
  final TodoViewModel viewModel;

  const TodoInheritedWidget({super.key,
    required this.viewModel,
    required super.child,
  });

  static TodoInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant TodoInheritedWidget oldWidget) {
    return viewModel != oldWidget.viewModel;
  }
}
