import 'package:flutter/material.dart';

class ColorPickerButton extends StatelessWidget {
  const ColorPickerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'color',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(90, 90),
          shape: const CircleBorder(),
          alignment: Alignment.center),
    );
  }
}
