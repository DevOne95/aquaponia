import 'package:flutter/material.dart';

class Feeder extends StatelessWidget {
  const Feeder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Text('Feeder'),
      ),
    );
  }
}
