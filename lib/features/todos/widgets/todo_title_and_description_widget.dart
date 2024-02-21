import 'package:flutter/material.dart';
import 'package:todo_flutter/shared/models/todo_model.dart';

import '../../../shared/widget/text_widget.dart';

class TodoTitleAndDescrptionWidget extends StatelessWidget {
  final TodoModel todo;

  const TodoTitleAndDescrptionWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          todo.title,
          cFontSize: 20,
        ),
        if (todo.description != null)
          TextWidget(
            todo.description!,
          ),
      ],
    ));
  }
}
