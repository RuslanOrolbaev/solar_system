import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: Colors.blueGrey, iconSize: 50, onPressed: onPressed, icon: icon);
  }
}
