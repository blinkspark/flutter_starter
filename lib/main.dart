import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/app_controller.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';

void main() {
  Get.lazyPut(() => Logger());
  Get.lazyPut(() => SharedPreferencesAsync());
  Get.lazyPut(() => AppController());
  runApp(const MainApp());
}

class MainApp extends GetView<AppController> {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextScaler.linear(2);
    return Obx(
      () => GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(1), // 固定缩放比例
            ),
            child: child!,
          );
        },
        theme: _buildTheme(Brightness.light, controller.themeColor.value),
        darkTheme: _buildTheme(Brightness.dark, controller.themeColor.value),
        themeMode: controller.themeMode.value,
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => const HomePage()),
          GetPage(name: "/settings", page: () => const SettingsPage()),
        ],
      ),
    );
  }

  ThemeData _buildTheme(Brightness brightness, MaterialColor seedColor) {
    final base = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: seedColor,
      ),
      appBarTheme: AppBarTheme(elevation: 4),
    );
    return base.copyWith(
      textTheme: GoogleFonts.notoSansScTextTheme(base.textTheme),
    );
  }
}
