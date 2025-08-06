import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../utils.dart';

class HomePage extends GetView<AppController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createNavbar(title: "Home"),
      body: SafeArea(child: Center(child: Text('MyController'))),
    );
  }
}
