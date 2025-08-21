import 'package:amrita_gatepass/features/Scanner/view/scanner_screen.dart';
import 'package:amrita_gatepass/utils/app_pages.dart';
import 'package:amrita_gatepass/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.scannerPage,
      getPages: AppPages.pages,
    );
  }
}
