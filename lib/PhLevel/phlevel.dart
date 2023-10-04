import 'package:flutter/material.dart';

class PhLevel extends StatelessWidget {
  const PhLevel({Key? key}) : super(key: key);

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
        child: Text('PH LEVEL'),
      ),
    );
  }
}
