import 'package:detest/color/Tcolor.dart';
import 'package:detest/controler/logincontroler.dart';
import 'package:detest/view/Register.dart';
import 'package:detest/widget/myboutom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class logInScreen extends StatelessWidget {
  final logInController controller = Get.put(logInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
                      height: 180,
                      child: Image.asset('assest/image/logo.png'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Login',
                        style: Theme.of(context).textTheme.displayMedium)
                  ],
                ),
                SizedBox(height: 80),
                Column(
                  children: [
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
                    SizedBox(height: 30),
                    My_button(
                      color: TColors.primary,
                      title: 'LogIn',
                      Titlecolor: TColors.white,
                      onpressed: () {
                        controller.login();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont Have an Account ?'),
                    TextButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: TColors.primary,
                          fontSize: 20,
                          fontFamily: 'AlBold',
                        ),
                      ),
                      onPressed: () {
                        Get.off(RegisterScreen());
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
