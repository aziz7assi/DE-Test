import 'package:country_code_picker/country_code_picker.dart';
import 'package:detest/color/Tcolor.dart';
import 'package:detest/controler/regestercontroller.dart';
import 'package:detest/view/login.dart';
import 'package:detest/widget/myboutom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatelessWidget {
  final Regestercontroller controller = Get.put(Regestercontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Container(
                      height: 120,
                      child: Image.asset('assest/image/logo.png'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Register',
                        style: Theme.of(context).textTheme.displayMedium)
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        controller.name(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Fullname',
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
                            initialSelection: 'AE',
                            favorite: ['+971', 'AE'],
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
                              decoration: const InputDecoration(
                                hintText: '55994435',
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
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Email',
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
                            hintText: 'password',
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                            child: controller.hidepasword.value == true
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
                          obscureText: controller.hideCpasword.value,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: TColors.primary,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.hideCpasword.value =
                                !controller.hideCpasword.value;
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: controller.hideCpasword.value == true
                                ? Icon(Icons.no_encryption_outlined)
                                : Icon(Icons.remove_red_eye),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 30),
                    My_button(
                      color: TColors.primary,
                      title: 'Register',
                      Titlecolor: TColors.white,
                      onpressed: () {
                        controller.Regrster();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an Account ?'),
                    TextButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: TColors.primary,
                          fontSize: 20,
                          fontFamily: 'AlBold',
                        ),
                      ),
                      onPressed: () {
                        Get.off(logInScreen());
                      },
                    )
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
