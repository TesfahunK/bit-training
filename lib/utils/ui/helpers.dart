import 'package:flutter/material.dart';

typedef DatePickerChanged = void Function(DateTime? date);

void datePicker(
  BuildContext context, {
  required DatePickerChanged onpicked,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final DateTime? _date = await showDatePicker(
    context: context,
    initialDate: initialDate ?? new DateTime.now(),
    firstDate: firstDate ?? new DateTime(1920),
    lastDate: lastDate ?? new DateTime.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(),
        child: child!,
      );
    },
  );

  onpicked(_date);
}
