import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                trailing: Obx(
                  () => SegmentedButton(
                    segments: [
                      ButtonSegment(
                        value: ThemeMode.system,
                        label: Text("跟随系统"),
                      ),
                      ButtonSegment(value: ThemeMode.light, label: Text("浅色")),
                      ButtonSegment(value: ThemeMode.dark, label: Text("暗黑")),
                    ],
                    selected: {controller.themeMode.value},
                    onSelectionChanged: (value) {
                      controller.setThemeMode(value.first);
                    },
                  ),
                ),
              ),
              ListTile(
                title: Text("主题颜色"),
                trailing: Obx(
                  () => OverflowBar(
                    children: [
                      for (final color in Colors.primaries)
                        GestureDetector(
                          onTap: () {
                            controller.setThemeColor(color);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: 16,
                              height: 16,
                              color: color,
                            ),
                          ),
                        ),
                    ],
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
