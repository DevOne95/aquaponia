import 'package:aquaponia/Util/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeederDisplay extends StatelessWidget {
  const FeederDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/feeder'),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 40, 62, 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text(DateFormat().getDayOfWeek(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 10),
                        const Icon(Icons.date_range,
                            color: Colors.white, size: 30),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(DateFormat().getTime(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(width: 10),
                        const Icon(Icons.watch_later_rounded,
                            color: Colors.white, size: 30),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text('Next Schedule Feeding',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Container(
                      width: 200,
                      height: 5,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Container(),
                    ))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
