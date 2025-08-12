import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../defs.dart';
import '../controllers/app_controller.dart';
import '../utils.dart';

class SettingsPage extends GetView<AppController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createNavbar(title: "Settings", showSettings: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                title: Text("主题模式"),
                trailing: DropdownMenu(
                  onSelected: (value) {
                    controller.setThemeMode(value ?? ThemeMode.system);
                  },
                  initialSelection: controller.themeMode.value,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: ThemeMode.light, label: "Light"),
                    DropdownMenuEntry(value: ThemeMode.dark, label: "Dark"),
                    DropdownMenuEntry(value: ThemeMode.system, label: "System"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text("主题颜色"),
                trailing: DropdownMenu(
                  onSelected: (value) {
                    controller.setThemeColor(value ?? Colors.blue);
                  },
                  initialSelection: controller.themeColor.value,
                  dropdownMenuEntries: Colors.primaries.map((e) {
                    final colorName =
                        primaryColorNames[Colors.primaries.indexOf(e)];
                    return DropdownMenuEntry(
                      value: e,
                      label: colorName,
                      labelWidget: Text(colorName, style: TextStyle(color: e)),
                    );
                  }).toList(),
                ),
              ),
              ListTile(
                title: Text("文字缩放（重启后生效）"),
                trailing: SizedBox(
                  width: 200,
                  child: Obx(
                    () => Slider(
                      value: controller.textScaler.value,
                      min: 0.8,
                      max: 1.2,
                      divisions: 10,
                      label: "${controller.textScaler.value}",
                      onChanged: (value) {
                        controller.setTextScaler(value);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
