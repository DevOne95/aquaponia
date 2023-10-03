import 'package:aquaponia/Database/database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void initializeDatabase() async {
    int result = await DatabaseConfig().insertData({
      'create_at': DateTime.now().toIso8601String(),
      'temperature_value': 25,
    }, 'temperature');

    print('Inserted Temperature record ID: $result');

    result = await DatabaseConfig().insertData({
      'create_at': DateTime.now().toIso8601String(),
      'ph_level_value': 35,
    }, 'phplevel');

    print('Inserted PH Level record ID: $result');

    result = await DatabaseConfig().insertData({
      'time': '08:00:00',
      'week_days': 1,
      'week_ends': 1,
      'entire_week': 1,
      'effective_at': DateTime.now().toIso8601String(),
      'end_date': DateTime.now().add(const Duration(days: 7)).toIso8601String(),
    }, DatabaseConfig.feederTable);

    print('Inserted record ID: $result');
  }
}
