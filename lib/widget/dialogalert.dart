import 'package:detest/color/Tcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorDialog(
  String title,
  String message,
  VoidCallback confirm,
  VoidCallback cancel,
) {
  Get.defaultDialog(
      backgroundColor: TColors.primary,
      titleStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'AlBold',
      ),
      title: title,
      middleText: message,
      middleTextStyle: TextStyle(
        color: TColors.white,
        fontSize: 24,
        fontFamily: 'AlBold',
        //   color: Colors.white,
        //   fontFamily: 'Hac',
      ),
      confirm: Row(
        children: [
          InkWell(
            onTap: confirm,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: 75,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'confirm',
                    style: TextStyle(
                      color: TColors.primary,
                      fontSize: 20,
                      fontFamily: 'Al',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: cancel,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'cancel',
                    style: TextStyle(
                      color: TColors.primary,
                      fontSize: 20,
                      fontFamily: 'Al',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
}
