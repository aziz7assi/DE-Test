import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:detest/view/HomeScreen.dart';
import 'package:detest/view/WellcomeScreen.dart';

class Inithome extends GetMiddleware {
  final box = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    int? isLoggedIn = box.read('log') ?? 0;
    if (isLoggedIn == 1) {
      print(isLoggedIn);
      return RouteSettings(name: Homescreen.routeName);
    } else {
      print(isLoggedIn);
      return RouteSettings(name: Wellcome.routeName);
    }
  }
}
