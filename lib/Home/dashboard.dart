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
            SizedBox(
              width: double.infinity,
              height: 80,
              child: AppLogo(),
            ),
            Expanded(
                flex: 2,
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FeederDisplay(),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TemperatureDisplay(),
                            )),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: PhLevelDisplay(),
                            )),
                          ],
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
