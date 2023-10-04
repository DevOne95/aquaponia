import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeTemperature extends StatelessWidget {
  const GaugeTemperature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.5,
        height: Get.width * 0.4,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              axisLineStyle: const AxisLineStyle(
                  thickness: 0.2,
                  thicknessUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve),
              showTicks: false,
              showLabels: false,
              minimum: 1,
              maximum: 160,
              interval: 10,
              pointers: [
                RangePointer(
                  color: const Color.fromARGB(255, 40, 62, 2),
                  value: 45,
                  onValueChanged: (_) {},
                  cornerStyle: CornerStyle.bothCurve,
                  onValueChangeEnd: (value) {},
                  onValueChangeStart: (value) {},
                  width: 0.2,
                  enableDragging: true,
                  sizeUnit: GaugeSizeUnit.factor,
                )
              ],
              annotations: const [
                GaugeAnnotation(
                  widget: Text(
                    '45 Temperature C\u00B0',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  positionFactor: 0.15,
                )
              ],
            )
          ],
        ));
  }
}
