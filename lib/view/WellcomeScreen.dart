import 'package:detest/color/Tcolor.dart';
import 'package:detest/view/Register.dart';
import 'package:detest/view/login.dart';
import 'package:detest/widget/myboutom.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Wellcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 10, right: 50, left: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('assest/image/logo.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Wellcome To The App',
                    style: Theme.of(context).textTheme.displayMedium)
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                My_button(
                    color: TColors.primary,
                    Titlecolor: TColors.white,
                    title: 'Login',
                    onpressed: () {
                      Get.to(logInScreen());
                    }),
                SizedBox(
                  height: 10,
                ),
                My_button(
                    color: TColors.white,
                    Titlecolor: TColors.primary,
                    title: 'Register',
                    onpressed: () {
                      Get.to(RegisterScreen());
                    })
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Center(child: Text('Designed & Devloped by Ali Fouad')),
          ],
        ),
      ),
    );
  }
}
