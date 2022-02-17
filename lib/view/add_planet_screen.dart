import 'package:flutter/material.dart';

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
        children: [
          //TODO form
          //TODO speed field
          //TODO radius field
          //TODO color field
          //TODO distance
          ElevatedButton(onPressed: () {}, child: const Text('Add planet'))
        ],
      ),
    )));
  }
}
