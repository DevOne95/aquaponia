import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.eco,
          color: Color.fromARGB(255, 40, 62, 2),
          size: 32,
        ),
        Text(
          'Aquaponia',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 40, 62, 2)),
        )
      ],
    );
  }
}
