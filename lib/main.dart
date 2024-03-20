import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaimin_chpl_practical/routes/app_pages.dart';

import 'Utils/ThemeData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jaimin Practical',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
