import 'package:flutter/material.dart';

class ModuleNavigation extends StatelessWidget {
  const ModuleNavigation({Key? key, this.title, this.value, this.icon})
      : super(key: key);

  final String? title;
  final String? value;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
        width: 300,
        height: 80,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 40, 62, 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  value ?? 'NONE',
                  style: const TextStyle(fontSize: 45, color: Colors.white),
                ),
              ),
              Expanded(
                  child: SizedBox(
                child: Row(
                  children: [
                    Text(title ?? 'NONE',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                    Icon(icon ?? Icons.error)
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
