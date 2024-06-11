import 'package:country_code_picker/country_code_picker.dart';
import 'package:detest/color/Tcolor.dart';
import 'package:detest/controler/logincontroler.dart';

import 'package:detest/widget/myboutom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Updatescreen extends StatelessWidget {
  final logInController controller = Get.find<logInController>();

  final String name;
  final String phone;
  final String code;
  final String email;
  final String token;

  Updatescreen(
      {required this.name,
      required this.phone,
      required this.code,
      required this.email,
      required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: TColors.white),
        title: Text('Update information',
            style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        backgroundColor: TColors.primary,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: TColors.white,
      body: Obx(() {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 10, right: 50, left: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        controller.name(value);
                      },
                      decoration: InputDecoration(
                        hintText: name,
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
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: TColors.primary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                          CountryCodePicker(
                            onChanged: (CountryCode code) {
                              controller.country_code(code.toString());
                            },
                            initialSelection: code,
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                controller.phone(value);
                              },
                              decoration: InputDecoration(
                                hintText: phone,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        controller.email(value);
                      },
                      decoration: InputDecoration(
                        hintText: email,
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
                    SizedBox(height: 50),
                    My_button(
                      color: TColors.primary,
                      title: 'Save',
                      Titlecolor: TColors.white,
                      onpressed: () {
                        controller.Updateinfo(token, name, email, phone, code);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
