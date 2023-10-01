import 'package:aquaponia/Feeder/feeder_display.dart';
import 'package:aquaponia/Home/applogo.dart';
import 'package:aquaponia/PhLevel/phplevel_display.dart';
import 'package:aquaponia/Temperature/temperature_display.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 62, 2),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(child: AppLogo()),
            Expanded(
                child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  TemperatureDisplay(),
                  SizedBox(height: 5),
                  PhLevelDisplay(),
                  SizedBox(height: 5),
                  FeederDisplay(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
