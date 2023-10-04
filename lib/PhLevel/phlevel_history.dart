import 'package:aquaponia/Home/home_controller.dart';
import 'package:aquaponia/PhLevel/Model/Phlevel_model.dart';
import 'package:aquaponia/Util/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhLevelHistory extends GetView<HomeController> {
  const PhLevelHistory({Key? key}) : super(key: key);

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
                    Text('PH Level',
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
                              .phLevelController.phLevels.value!.length,
                          itemBuilder: (BuildContext context, int index) {
                            PhLevel model = controller
                                .phLevelController.phLevels.value![index];
                            return Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? Colors.white
                                      : Colors.black12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child: Center(
                                      child: Text(
                                          '${model.value!.toString()} pH',
                                          style: const TextStyle(fontSize: 15)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Center(
                                      child: Text(
                                          model.value! < 7
                                              ? 'Acidic'
                                              : model.value! > 7
                                                  ? 'Alkaline'
                                                  : 'Neutral',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: model.value! < 7
                                                  ? Colors.deepOrange
                                                  : model.value! > 7
                                                      ? Colors.purple
                                                      : Colors.green,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
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
