import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 100,
            height: 100,
            child: SvgPicture.asset(
              './assets/logo/logo_icon.svg',
              semanticsLabel: 'Aquaponia Logo',
              width: 100,
              height: 100,
            )),
        const Text(
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
