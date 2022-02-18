import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldForDoubles extends StatelessWidget {
  const FieldForDoubles({required this.controller, this.hint, Key? key})
      : super(key: key);

  final TextEditingController controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))
        ],
        decoration: InputDecoration(
          hintText: hint,
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: (number) {
          if (number != null && number.isNotEmpty) {
            return null;
          } else {
            return 'value is required';
          }
        });
  }
}
