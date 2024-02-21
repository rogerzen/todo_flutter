import 'package:flutter/material.dart';
import 'package:todo_flutter/shared/widget/text_widget.dart';

class TextImputWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final bool readOnly;
  final TextInputAction textInputAction;

  const TextImputWidget(
      {required this.controller,
      required this.focusNode,
      required this.label,
      this.autoFocus = false,
      this.textCapitalization = TextCapitalization.none,
      this.validator,
      this.onFieldSubmitted,
      this.maxLines,
      this.minLines,
      this.onTap,
      this.readOnly = false,
      super.key,
      this.textInputAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autoFocus,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        label: TextWidget(label),
        border: const OutlineInputBorder(),
      ),
      textCapitalization: textCapitalization,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      minLines: minLines,
      maxLines: maxLines,
      onTap: onTap,
      readOnly: readOnly,
      textInputAction: textInputAction,
    );
  }
}
