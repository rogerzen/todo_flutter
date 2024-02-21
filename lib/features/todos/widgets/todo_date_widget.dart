import 'package:flutter/material.dart';
import 'package:todo_flutter/shared/extensions/date_estension.dart';
import 'package:todo_flutter/shared/models/todo_model.dart';

import '../../../shared/widget/text_widget.dart';

class TodoDateWidget extends StatelessWidget {
  final TodoModel todo;

  const TodoDateWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextWidget(
        todo.date.formatDate,
      ),
    );
  }
}
