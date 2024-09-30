import 'package:flutter/material.dart';

class TaskTextFormField extends StatelessWidget {
  const TaskTextFormField({
    super.key,
    this.onSaved,
    required this.labelText,
    this.onChanged,
    this.maxLines, String? initialValue,
  });
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String labelText;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: labelText,
      ),
      onSaved: onSaved,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is Required';
        } else {
          return null;
        }
      },
    );
  }
}
