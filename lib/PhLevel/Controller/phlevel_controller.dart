import 'dart:async';

import 'package:aquaponia/Database/database.dart';
import 'package:aquaponia/PhLevel/Model/Phlevel_model.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PhLevelController extends GetxController {
  final String phLevel = 'phlevel';
  RxInt phlevelFilter = 1.obs;

  Rxn<PhLevel>? latestPhLevel = Rxn<PhLevel>(null).obs();
  Rxn<List<PhLevel>> phLevels = Rxn<List<PhLevel>>([]).obs();

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

  void fetchdaysRecords() async {
    List<Map<String, dynamic>> results = await DatabaseConfig()
        .getDaysRecord(phLevel, phlevelFilter.value == 2 ? 30 : 7);

    int numberOfResults = results.length;

    if (numberOfResults == 0) {
      return;
    }

    phLevels.value!.clear();

    for (Map<String, dynamic> result in results) {
      phLevels.value!.add(PhLevel(
        id: result['id'],
        value: result['ph_level_value'],
        date: DateTime.parse(result['create_at']),
      ));
    }

    phLevels.refresh();
  }

  void fetchPhRecords() async {
    List<Map<String, dynamic>> results =
        await DatabaseConfig().fetchAllData('phlevel');

    int numberOfResults = results.length;

    if (numberOfResults == phLevels.value!.length) {
      return;
    }

    phLevels.value!.clear();

    for (Map<String, dynamic> result in results) {
      phLevels.value!.add(PhLevel(
        id: result['id'],
        value: result['ph_level_value'],
        date: DateTime.parse(result['create_at']),
      ));
    }

    phLevels.refresh();
  }

  void fetchLatestRecord() async {
    List<Map<String, dynamic>> results =
        await DatabaseConfig().getLatestPHLevel('phlevel');

    try {
      if (results.isNotEmpty) {
        Map<String, dynamic> result = results.first;
        latestPhLevel?.value = PhLevel(
          id: result['id'],
          value: result['ph_level_value'],
          date: DateTime.parse(result['create_at']),
        );
      } else {
        throw Exception('No records found in the database.');
      }
    } catch (err) {
      print(err);
    }
  }

  NeedlePointer get phValue => NeedlePointer(
      value: double.parse(latestPhLevel!.value!.value.toString()));
}
