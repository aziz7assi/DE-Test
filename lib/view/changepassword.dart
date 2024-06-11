import 'package:detest/color/Tcolor.dart';
import 'package:detest/controler/changepasswordcontroller.dart';
import 'package:detest/widget/myboutom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Changepassword extends StatelessWidget {
  final Changepasswordcontroller controller =
      Get.put(Changepasswordcontroller());

  final String token;

  Changepassword({required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: TColors.white),
        title: Text('ChangePassword',
            style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        backgroundColor: TColors.primary,
      ),
      body: Obx(() {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 10, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    TextField(
                      obscureText: controller.hidepasword.value,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        controller.password(value);
                      },
                      decoration: InputDecoration(
                        hintText: ' Password',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TColors.primary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TColors.primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.hidepasword.value =
                            !controller.hidepasword.value;
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: controller.hidepasword == true
                            ? Icon(Icons.no_encryption_outlined)
                            : Icon(Icons.remove_red_eye),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    TextField(
                      obscureText: controller.hidepasword.value,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        controller.password_confirm(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'password_confirm',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TColors.primary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TColors.primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.hidepConfasword.value =
                            !controller.hidepConfasword.value;
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: controller.hidepConfasword == true
                            ? Icon(Icons.no_encryption_outlined)
                            : Icon(Icons.remove_red_eye),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    TextField(
                      obscureText: controller.hidepasword.value,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        controller.current_password(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'current_password',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TColors.primary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TColors.primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.hideCupasword.value =
                            !controller.hideCupasword.value;
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: controller.hideCupasword == true
                            ? Icon(Icons.no_encryption_outlined)
                            : Icon(Icons.remove_red_eye),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                My_button(
                  color: TColors.primary,
                  title: 'Change Password',
                  Titlecolor: TColors.white,
                  onpressed: () {
                    controller.changepass(token);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
