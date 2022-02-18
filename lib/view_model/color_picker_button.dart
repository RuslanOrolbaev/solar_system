import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:solar_system/model/providers/color_provider.dart';

class ColorPickerButton extends StatefulWidget {
  const ColorPickerButton({this.defaultColor = Colors.orange, Key? key})
      : super(key: key);

  final Color defaultColor;

  @override
  State<ColorPickerButton> createState() => _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  late Color pickedColor;

  @override
  void initState() {
    pickedColor = widget.defaultColor;
    ColorProvider.instance.color = pickedColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(90, 90),
          shape: const CircleBorder(),
          primary: pickedColor),
      child: const Text(
        'color',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Pick a color'),
                content: SingleChildScrollView(
                  child: BlockPicker(
                    pickerColor: widget.defaultColor,
                    onColorChanged: (Color color) {
                      ColorProvider.instance.color = color;
                      setState(() {
                        pickedColor = color;
                      });
                    },
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('PICK'),
                    onPressed: () {
                      Navigator.pop(context); //dismiss the color picker
                    },
                  ),
                ],
              );
            });
      },
    );
  }
}
