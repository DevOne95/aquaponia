import 'package:aquaponia/Home/module_navigation.dart';
import 'package:flutter/material.dart';

class FeederDisplay extends StatelessWidget {
  const FeederDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ModuleNavigation(
        title: 'Fish Feeder', value: '3:55 PM', icon: Icons.autorenew);
  }
}
