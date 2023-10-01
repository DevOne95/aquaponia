import 'package:aquaponia/Home/module_navigation.dart';
import 'package:flutter/material.dart';

class TemperatureDisplay extends StatelessWidget {
  const TemperatureDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleNavigation(
        title: "Temperature", value: 45.toString(), icon: Icons.thermostat);
  }
}