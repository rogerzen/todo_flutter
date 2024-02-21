import 'package:flutter/material.dart';

import '../../../shared/widget/inputs/text_inputs.dart';

class DescriptionTextInputWidget extends StatelessWidget {
  final TextEditingController descriptionTEC;
  final FocusNode descriptionFN;
  final FocusNode todoDateFN;

  const DescriptionTextInputWidget({
    Key? key,
    required this.descriptionTEC,
    required this.descriptionFN,
    required this.todoDateFN,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextImputWidget(
      controller: descriptionTEC,
      focusNode: descriptionFN,
      label: 'Descrição',
      minLines: 4,
      maxLines: 6,
      autoFocus: true,
      textCapitalization: TextCapitalization.sentences,
      onFieldSubmitted: (_) => todoDateFN.requestFocus(),
    );
  }
}
