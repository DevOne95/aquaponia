// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:math';
import 'package:aquaponia/Database/database.dart';
import 'package:aquaponia/Home/Notification/notification.dart';
import 'package:get/get.dart';
import 'package:background_fetch/background_fetch.dart';

class BackgroundFetchController extends GetxController {
  @override
  void onInit() {
    initBackgroundFetch();
    BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
    super.onInit();
  }

  void initBackgroundFetch() async {
    print('background task trigger');
    // Step 1:  Configure BackgroundFetch as usual.
    await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 5,
            enableHeadless: true,
            stopOnTerminate: false), (String taskId) async {
      // <-- Event callback.
      // This is the fetch-event callback.
      print("[BackgroundFetch] taskId: $taskId");

      // Use a switch statement to route task-handling.
      switch (taskId) {
        case 'com.phLevel.customtask':
          generatepHLevel();
          break;
        case 'com.temperature.customtask':
          generateTemperature();
          break;
        default:
          print("Default fetch task");
      }
      // Finish, providing received taskId.
      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      // <-- Event timeout callback
      // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
      print("[BackgroundFetch] TIMEOUT taskId: $taskId");
      BackgroundFetch.finish(taskId);
    });
    BackgroundFetch.scheduleTask(TaskConfig(
        taskId: "com.phLevel.customtask", delay: 5000 // <-- milliseconds
        ));

    BackgroundFetch.scheduleTask(TaskConfig(
        taskId: "com.temperature.customtask", delay: 5000 // <-- milliseconds
        ));

    Timer.periodic(const Duration(minutes: 2), (timer) {
      // Step 2:  Schedule a custom "oneshot" task "com.transistorsoft.customtask" to execute 5000ms from now.
      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "com.phLevel.customtask", delay: 5000 // <-- milliseconds
          ));

      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "com.temperature.customtask", delay: 5000 // <-- milliseconds
          )); //Fetch data periodically
    });
  }

  void backgroundFetchHeadlessTask(String taskId) async {
    // This is the headless task that will be triggered even when the app is terminated.
    // Perform the same task as in the onBackgroundFetch callback.
    try {
      switch (taskId) {
        case 'com.phLevel.customtask':
          generatepHLevel();
          break;
        case 'com.temperature.customtask':
          generateTemperature();
          break;
        default:
          print("Default fetch task");
      }
    } catch (e) {
      print("Exception occurred: $e");
      Notification notification = Notification();
      notification.initialize();
      notification.showNotification(
        id: 1,
        title: 'Error',
        body: 'ph Value update $e',
      );
    }

    // Finish the headless task.
    BackgroundFetch.finish(taskId);
  }

  void generatepHLevel() async {
    print("Received custom task");

    // Generate a random number from 1 to 14
    Random random = Random();
    int phLevel = random.nextInt(14) + 1;

    // Get current date and time
    String datetime = DateTime.now().toIso8601String();

    // Create a row to insert into the database
    Map<String, dynamic> row = {
      'ph_level_value': phLevel,
      'create_at': datetime,
    };

    Notification notification = Notification();
    notification.initialize();
    notification.showNotification(
      id: phLevel,
      title: 'New pH level',
      body: 'ph Value update $phLevel',
    );

    // Insert the data into the SQLite database
    DatabaseConfig databaseConfig = DatabaseConfig();
    int result = await databaseConfig.insertData(row, 'phlevel');

    print("Inserted $result row(s) into the database.");
  }

  void generateTemperature() async {
    print("Received custom task");

    // Generate a random number from 1 to 14
    Random random = Random();
    int temperature = random.nextInt(40) + 1;

    // Get current date and time
    String datetime = DateTime.now().toIso8601String();

    // Create a row to insert into the database
    Map<String, dynamic> row = {
      'temperature_value': temperature,
      'create_at': datetime,
    };

    Notification notification = Notification();
    notification.initialize();
    notification.showNotification(
      id: temperature,
      title: 'New temperature',
      body: 'Temperature update value $temperature',
    );

    // Insert the data into the SQLite database
    DatabaseConfig databaseConfig = DatabaseConfig();
    int result = await databaseConfig.insertData(row, 'temperature');

    print("Inserted $result row(s) into the database.");
  }
}
