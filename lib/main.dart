import 'package:detest/color/Tcolor.dart';
import 'package:detest/view/WellcomeScreen.dart';
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
          textTheme: ThemeData.light().textTheme.copyWith(
                displayMedium: TextStyle(
                  color: TColors.primary,
                  fontSize: 24,
                  fontFamily: 'AlBold',
                ),
                displaySmall: TextStyle(
                  color: TColors.white,
                  fontSize: 24,
                  fontFamily: 'Al',
                ),
                titleMedium: TextStyle(
                  color: TColors.white,
                  fontSize: 24,
                  fontFamily: 'AlBold',
                ),
                titleSmall: TextStyle(
                  color: TColors.bla,
                  fontSize: 20,
                  fontFamily: 'Al',
                ),
              ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        locale: Locale('en'),
        home: Wellcome());
  }
}
