import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemperatureHistory extends StatelessWidget {
  const TemperatureHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: Get.width,
                height: 40,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Temperature',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    SizedBox(
                      width: 80,
                      child: Text('Status',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text('Date',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? Colors.white
                                    : Colors.grey),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: Center(
                                    child: Text('45 C\u00B0',
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                  child: Center(
                                    child: Text('High',
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                  child: Text('10/01/2023',
                                      style: TextStyle(fontSize: 12)),
                                ),
                              ],
                            ),
                          );
                        })))
          ],
        ));
  }
}
