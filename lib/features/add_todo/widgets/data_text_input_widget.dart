import 'package:flutter/material.dart';
import 'package:todo_flutter/shared/extensions/date_estension.dart';

import '../../../shared/widget/inputs/text_inputs.dart';

class DateTextInputWidget extends StatelessWidget {
  final TextEditingController todoDateTec;
  final FocusNode todoDateFN;
  final void Function(DateTime date) setDate;

  const DateTextInputWidget(
      {required this.todoDateTec,
      required this.todoDateFN,
      required this.setDate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextImputWidget(
      controller: todoDateTec,
      focusNode: todoDateFN,
      label: 'Data',
      validator: (String? newTodoDate) {
        if (newTodoDate == null || newTodoDate.isEmpty) {
          return 'Você precisa Adicionar uma data para a tarefa';
        }
        return null;
      },
      textInputAction: TextInputAction.send,
      readOnly: true,
      onTap: () async {
        final DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365 * 100),
          ),
        );
        String stringDate = '';

        if (date != null) {
          setDate(date);
          stringDate = date.formatDate;
        }
        todoDateTec.text = stringDate;
      },
    );
  }
}
