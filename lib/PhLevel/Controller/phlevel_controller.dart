import 'package:aquaponia/Database/database.dart';
import 'package:aquaponia/PhLevel/Model/Phlevel_model.dart';
import 'package:get/get.dart';

class PhLevelController extends GetxController {
  Rxn<PhLevel>? latestPhLevel = Rxn<PhLevel>(null).obs();
  Rxn<List<PhLevel>> phLevels = Rxn<List<PhLevel>>([]).obs();

  @override
  void onInit() {
    fetchLatestRecord();
    fetchPhRecords();
    super.onInit();
  }

  void fetchPhRecords() async {
    List<Map<String, dynamic>> results =
        await DatabaseConfig().fetchAllData('phlevel');

    for (Map<String, dynamic> result in results) {
      phLevels.value!.add(PhLevel(
        id: result['id'],
        value: result['ph_level_value'],
        date: DateTime.parse(result['create_at']),
      ));
    }
  }

  void fetchLatestRecord() async {
    List<Map<String, dynamic>> results =
        await DatabaseConfig().getLatestPHLevel('phlevel');

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
  }
}
