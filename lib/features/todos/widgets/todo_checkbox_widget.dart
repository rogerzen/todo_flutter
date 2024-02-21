import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/features/todos/controllers/todo_controller.dart';
import 'package:todo_flutter/shared/models/todo_model.dart';

class TodoCheckboxWidget extends StatelessWidget {
  final TodoModel todo;

  const TodoCheckboxWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    final todosCtrl = context.watch<TodosController>();

    return Checkbox(
      value: todosCtrl.isTodoChecked(todo.id),
      onChanged: (bool? isDone) => todosCtrl.checkTodo(todo.id),
    );
  }
}
