import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solar_system/view_model/color_picker_button.dart';
import 'package:solar_system/view_model/field_for_doubles.dart';
import 'package:logging/logging.dart';

Logger _logger = Logger('AddPlanetScreen');

class AddPlanetScreen extends StatefulWidget {
  const AddPlanetScreen({Key? key}) : super(key: key);

  @override
  _AddPlanetScreenState createState() => _AddPlanetScreenState();
}

class _AddPlanetScreenState extends State<AddPlanetScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _speedFieldController = TextEditingController();
  final TextEditingController _distanceFieldController =
      TextEditingController();
  final TextEditingController _radiusFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
              child: Text(
            'ADD YOUR PLANET',
            style: TextStyle(fontSize: 30),
          )),
          FieldForDoubles(
            controller: _radiusFieldController,
            hint: 'enter radius',
          ),
          FieldForDoubles(
            controller: _distanceFieldController,
            hint: 'enter distance',
          ),
          FieldForDoubles(
            controller: _speedFieldController,
            hint: 'enter speed',
          ),
          Center(child: ColorPickerButton()),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    FormState formState = _formKey.currentState!;
                    if (formState.validate()) {
                      _logger.info('valid');
                    } else {
                      (_logger.info('not valid'));
                    }
                  },
                  child: const Text('Add')))
        ],
      ),
    )));
  }
}
