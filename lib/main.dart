import 'package:aquaponia/Database/database.dart';
import 'package:aquaponia/Home/dashboard.dart';
import 'package:aquaponia/Home/home.dart';
import 'package:aquaponia/Home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  DatabaseConfig databaseConfig = DatabaseConfig();
  await databaseConfig.initDatabase();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    homeController.initializeDatabase();

    return GetMaterialApp(
      title: 'Aquaponia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 40, 62, 2)),
        useMaterial3: true,
      ),
      home: const Home(),
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        GetPage(name: '/dashboard', page: () => const Dashboard()),
      ],
    );
  }
}
