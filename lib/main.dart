import 'package:detest/color/Tcolor.dart';
import 'package:detest/middleware.dart';
import 'package:detest/view/HomeScreen.dart';
import 'package:detest/view/WellcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DETest',
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
      initialRoute: Homescreen.routeName,
      getPages: [
        GetPage(
            name: Homescreen.routeName,
            page: () => Homescreen(),
            middlewares: [Inithome()]),
        GetPage(name: Wellcome.routeName, page: () => Wellcome()),
      ],
    );
  }
}
