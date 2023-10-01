import 'package:aquaponia/Home/module_navigation.dart';
import 'package:flutter/material.dart';

class PhLevelDisplay extends StatelessWidget {
  const PhLevelDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleNavigation(
        title: 'Ph Level', value: 7.5.toString(), icon: Icons.touch_app);
  }
}
