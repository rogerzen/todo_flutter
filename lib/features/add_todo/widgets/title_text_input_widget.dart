import 'package:flutter/material.dart';

import '../../../shared/widget/inputs/text_inputs.dart';

class TitleTextInputWidget extends StatelessWidget {
  final TextEditingController titleTEC;
  final FocusNode titleFN;
  final FocusNode descriptionFN;

  const TitleTextInputWidget(
      {Key? key,
      required this.titleTEC,
      required this.titleFN,
      required this.descriptionFN})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextImputWidget(
      controller: titleTEC,
      focusNode: titleFN,
      label: 'titulo',
      autoFocus: true,
      textCapitalization: TextCapitalization.words,
      onFieldSubmitted: (_) => descriptionFN.requestFocus(),
      validator: (String? title) {
        if (title == null || title.isEmpty) {
          return 'Você precisa adicionar um título';
        }
        return null;
      },
    );
  }
}
