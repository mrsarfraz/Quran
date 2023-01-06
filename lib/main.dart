import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quran/app/routes/app_pages.dart';
import 'package:quran/app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.getPages,
      initialRoute: AppRoutes.homePage,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

