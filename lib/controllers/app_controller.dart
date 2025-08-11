import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  final SharedPreferencesAsync sp = Get.find();

  @override
  void onInit() {
    sp.getInt('app.theme_mode').then((int? v) {
      v = v ?? 0;
      themeMode.value = ThemeMode.values[v];
      sp.setInt('app.theme_mode', v);
    });

    sp.getInt('app.theme_color').then((int? v) {
      v = v ?? 5;
      themeColor.value = Colors.primaries[v];
      sp.setInt('app.theme_color', v);
    });

    sp.getDouble('app.text_scaler').then((double? v) {
      v = v ?? 1.0;
      textScaler.value = v;
      sp.setDouble('app.text_scaler', v);
    });
    super.onInit();
  }

  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  void setThemeMode(ThemeMode theme) {
    themeMode.value = theme;
  }

  final Rx<MaterialColor> themeColor = Colors.blue.obs;
  void setThemeColor(MaterialColor color) {
    themeColor.value = color;
    final colorIndex = Colors.primaries.indexOf(color);
    if (colorIndex >= 0) {
      sp.setInt("app.theme_color", colorIndex);
    }
  }

  final Rx<double> textScaler = 1.0.obs;
  void setTextScaler(double scaler) {
    textScaler.value = scaler;
    sp.setDouble("app.text_scaler", scaler);
  }
}
