// ignore_for_file: avoid_print

import 'dart:async';

import 'package:aquaponia/Database/database.dart';
import 'package:aquaponia/Feeder/Model/feeder_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeederController extends GetxController {
  final String history = 'feederhistory';
  final String feederConfig = 'feeder';

  final RxInt historyFilter = 1.obs;

  final TextEditingController timeData = TextEditingController();

  Rxn<List<FeederModel>> currentFeederSchedules =
      Rxn<List<FeederModel>>([]).obs();
  Rxn<List<FeederModel>> historyFeed = Rxn<List<FeederModel>>([]).obs();

  RxString time = ''.obs;

  @override
  void onInit() {
    fetchLatestSchedules();
    fetchFeederRecords();
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      fetchLatestSchedules();
      fetchFeederRecords();
    });
    super.onInit();
  }

  void fetchFeederRecords() async {
    List<Map<String, dynamic>> results =
        await DatabaseConfig().fetchAllData(history);

    int numberOfResults = results.length;

    if (numberOfResults == 0) {
      return;
    }

    if (numberOfResults == historyFeed.value!.length) {
      return;
    }

    historyFeed.value!.clear();

    for (Map<String, dynamic> result in results) {
      historyFeed.value!.add(FeederModel(
        id: result['id'],
        time: result['time'],
        status: RxBool(result['status'] == 0),
        date: DateTime.parse(result['date']),
      ));
    }

    historyFeed.refresh();
  }

  void fetchLatestSchedules() async {
    List<Map<String, dynamic>> results =
        await DatabaseConfig().fetchAllData('feeder');

    int numberOfResults = results.length;

    if (numberOfResults == 0) {
      return;
    }

    if (numberOfResults == currentFeederSchedules.value!.length) {
      return;
    }

    try {
      if (results.isNotEmpty) {
        List<FeederModel> schedules = [];

        for (var result in results) {
          FeederModel feederModel = FeederModel(
            id: result['id'],
            time: result['time'],
            status: RxBool(result['status'] == 0),
            date: DateTime.parse(result['date']),
          );

          schedules.add(feederModel);
        }

        currentFeederSchedules.value = schedules;
        currentFeederSchedules.refresh();
      } else {
        throw Exception('No records found in the database.');
      }
    } catch (err) {
      print(err);
    }
  }

  bool registerSchedule() {
    try {
      DatabaseConfig().insertData({
        'time': timeData.text,
        'status': 0,
        'date': DateTime.now().toIso8601String()
      }, 'feeder');

      currentFeederSchedules.value!.add(FeederModel(
          id: 100,
          time: timeData.text,
          status: RxBool(false),
          date: DateTime.now()));
      currentFeederSchedules.refresh();
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }
}
