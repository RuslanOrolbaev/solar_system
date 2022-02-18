import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_system/constants.dart';
import 'package:solar_system/model/planet.dart';
import 'package:solar_system/model/providers/color_provider.dart';
import 'package:solar_system/model/providers/planet_list_provider.dart';
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
    final planetListProvider =
        Provider.of<PlanetListProvider>(context, listen: false);
    _logger.info(buildMessage);
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          const Center(child: ColorPickerButton()),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 60),
                    shape: const ContinuousRectangleBorder()),
                onPressed: () {
                  FormState formState = _formKey.currentState!;
                  if (formState.validate()) {
                    planetListProvider.add(Planet(
                        radius: double.parse(_radiusFieldController.text),
                        speed: double.parse(_speedFieldController.text),
                        distanceFromCenter:
                            double.parse(_distanceFieldController.text),
                        color: ColorProvider.instance.color!,
                        angleInDegrees: 0));
                    Navigator.pop(context);
                  }
                },
                child: const Text('ADD PLANET')),
          )
        ],
      ),
    )));
  }

  @override
  void dispose() {
    _logger.info(disposeMessage);
    _distanceFieldController.dispose();
    _speedFieldController.dispose();
    _radiusFieldController.dispose();
    super.dispose();
  }
}
