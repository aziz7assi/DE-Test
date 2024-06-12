import 'package:detest/color/Tcolor.dart';
import 'package:detest/controler/logincontroler.dart';
import 'package:detest/model/usermoder.dart';
import 'package:detest/view/changepassword.dart';
import 'package:detest/view/updateScreen.dart';
import 'package:detest/widget/UserOpitionBilder.dart';
import 'package:detest/widget/dialogalert.dart';
import 'package:detest/widget/rowdatabilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Homescreen extends StatelessWidget {
  static const String routeName = '/home';

  final logInController controller = Get.put(logInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('Home Page', style: Theme.of(context).textTheme.titleMedium),
          centerTitle: true,
          backgroundColor: TColors.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<logInController>(
            init: controller,
            builder: (_) {
              User? user = controller.getUser();

              return Column(
                children: [
                  Column(
                    children: [
                      RowData(
                          title: user!.name,
                          icon: Icon(
                            Icons.person_2_outlined,
                            color: TColors.primary,
                            size: 30,
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      RowData(
                          title: user.country_code + user.phone,
                          icon: Icon(
                            Icons.phone_android_outlined,
                            color: TColors.primary,
                            size: 30,
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      RowData(
                          title: user.email,
                          icon: Icon(
                            Icons.email_outlined,
                            color: TColors.primary,
                            size: 30,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  UserOpitionBilder(
                    title: 'Update information',
                    onpressed: () async {
                      await Get.to(() => Updatescreen(
                            name: user.name,
                            phone: user.phone,
                            code: user.country_code,
                            email: user.email,
                            token: user.token,
                          ));
                      controller.update();
                    },
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  UserOpitionBilder(
                    title: 'Change Password',
                    onpressed: () {
                      Get.to(Changepassword(token: user.token));
                    },
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  UserOpitionBilder(
                    title: 'Delete account',
                    onpressed: () {
                      showErrorDialog('Delete Account', 'are you sure', () {
                        controller.deleteAccount(user.token);
                      }, () {
                        Get.back();
                      });
                    },
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  UserOpitionBilder(
                    title: 'Logout',
                    onpressed: () {
                      showErrorDialog('LogOut', 'are you sure', () {
                        controller.logout();
                      }, () {
                        Get.back();
                      });
                    },
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              );
            },
          ),
        ));
  }
}
