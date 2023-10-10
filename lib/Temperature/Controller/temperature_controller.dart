import 'dart:async';

import 'package:aquaponia/Database/database.dart';
import 'package:aquaponia/Temperature/Model/temperature_model.dart';
import 'package:get/get.dart';

class TemperatureController extends GetxController {
  Rxn<Temperature>? latestTemperature = Rxn<Temperature>(null).obs();
  Rxn<List<Temperature>> temperatures = Rxn<List<Temperature>>([]).obs();

  @override
  void onInit() {
    fetchLatestRecord();
    fetchPhRecords();
    Timer.periodic(const Duration(minutes: 1), (timer) {
      fetchLatestRecord();
      fetchPhRecords(); // Fetch data periodically
    });
    super.onInit();
  }

  void fetchPhRecords() async {
    List<Map<String, dynamic>> results =
        await DatabaseConfig().fetchAllData('temperature');

    int numberOfResults = results.length;

    if (numberOfResults == temperatures.value!.length) {
      return;
    }

    temperatures.value!.clear();

    for (Map<String, dynamic> result in results) {
      temperatures.value!.add(Temperature(
        id: result['id'],
        value: result['temperature_value'],
        date: DateTime.parse(result['create_at']),
      ));
    }
    temperatures.refresh();
  }

  void fetchLatestRecord() async {
    List<Map<String, dynamic>> results =
        await DatabaseConfig().getLatestPHLevel('temperature');

    try {
      if (results.isNotEmpty) {
        Map<String, dynamic> result = results.first;
        latestTemperature?.value = Temperature(
          id: result['id'],
          value: result['temperature_value'],
          date: DateTime.parse(result['create_at']),
        );
      } else {
        throw Exception('No records found in the database.');
      }
    } catch (err) {
      print(err);
    }
  }
}
