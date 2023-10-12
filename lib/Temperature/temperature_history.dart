import 'package:aquaponia/Home/home_controller.dart';
import 'package:aquaponia/Temperature/Model/temperature_model.dart';
import 'package:aquaponia/Util/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemperatureHistory extends GetView<HomeController> {
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
                    child: Obx(
                      () => ListView.builder(
                          itemCount: controller
                              .temperatureController.temperatures.value!.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (controller.temperatureController.temperatures
                                .value!.isEmpty) {
                              return Container();
                            }
                            Temperature model = controller.temperatureController
                                .temperatures.value![index];

                            return Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? Colors.white
                                      : Colors.grey),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child: Center(
                                      child: Text(
                                          '${model.value.toString()} C\u00B0',
                                          style: const TextStyle(fontSize: 15)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Center(
                                      child: Text(model.condition(),
                                          style: const TextStyle(fontSize: 15)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                    child: Text(
                                        DateFormat.withValue(model.date!)
                                            .dateTodayShort(),
                                        style: const TextStyle(fontSize: 12)),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )))
          ],
        ));
  }
}
