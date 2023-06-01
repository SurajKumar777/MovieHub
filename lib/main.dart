import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    GetMaterialApp(
      title: "Application",
      // initialRoute: AppPages.INITIAL,
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
    ),
  );
}
