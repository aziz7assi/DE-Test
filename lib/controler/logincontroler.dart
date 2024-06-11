import 'package:detest/color/Tcolor.dart';
import 'package:detest/model/usermoder.dart';
import 'package:detest/service/drleteaccount.dart';
import 'package:detest/service/loginserivce.dart';
import 'package:detest/service/updatesrevice.dart';
import 'package:detest/view/HomeScreen.dart';
import 'package:detest/view/WellcomeScreen.dart';
import 'package:detest/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class logInController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  final hidepasword = false.obs;

  var name = ''.obs;
  var phone = ''.obs;
  var country_code = ''.obs;
  var isLoading = false.obs;

  final box = GetStorage();

  ///////////////////////
  ///Login

  Future<void> login() async {
    final LoginApiService apiService = LoginApiService();
    isLoading(true);

    try {
      var response = await apiService.login(email.value, password.value);
      int statusCode = response['statusCode'];
      User? user = response['data'];
      String? message = response['message'];

      if (statusCode == 200 && user != null) {
        box.write('user', user.toJson());

        Get.offAll(() => Homescreen());
      } else if (statusCode == 401) {
        Get.defaultDialog(
          title: 'Sory',
          middleText: 'Username Or Password Is Uncorrect',
        );
      } else {
        Get.defaultDialog(
          title: 'Eror',
          middleText: message as String,
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Eror',
        middleText: 'Please Try Again'.tr,
      );
    } finally {
      isLoading(false);
    }
  }
  //////////////////
  ////GetUser

  User? getUser() {
    Map<String, dynamic>? userData = box.read('user');
    if (userData != null) {
      return User.fromJson(userData);
    }
    return null;
  }

////////////////////////
////Update

  Future<void> Updateinfo(String token, String oldName, String oldEmail,
      String oldPhone, String oldCountryCode) async {
    final Updatesrevice apiService = Updatesrevice();
    isLoading(true);

    try {
      var response = await apiService.Update(
          oldName,
          oldEmail,
          oldPhone,
          oldCountryCode,
          name.value,
          email.value,
          phone.value,
          country_code.value,
          token);
      int statusCode = response['statusCode'];
      String? message = response['data'];

      if (statusCode == 200) {
        updateUser(name.value, phone.value, country_code.value, email.value);
      } else if (statusCode == 400) {
        Get.defaultDialog(
          title: 'Sory',
          middleText: message as String,
        );
      } else if (statusCode == 500) {
        Get.defaultDialog(
          title: 'Sory',
          middleText: message as String,
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Sory',
        middleText: 'Something is woring',
      );
    } finally {
      isLoading(false);
    }
  }

  void updateUser(
      String newname, String newphone, String newcode, String newemail) {
    Map<String, dynamic>? userData = box.read('user');
    if (userData != null) {
      User user = User.fromJson(userData);
      user.name = newname;
      user.email = newemail;
      user.country_code = newcode;
      user.phone = newphone;

      box.write('user', user.toJson());
      update();
      Get.back();
      Get.snackbar(
        'succ',
        'info updated succ',
        snackPosition: SnackPosition.BOTTOM,
        colorText: TColors.white,
        backgroundColor: Colors.green,
        snackStyle: SnackStyle.FLOATING,
      );
    }
  }

/////////////////
  ///delete

  Future<void> deleteAccount(String token) async {
    final deleteservice apiService = deleteservice();
    isLoading(true);

    try {
      var response = await apiService.delete(token);
      int statusCode = response['statusCode'];

      if (statusCode == 200) {
        Get.offAll(Wellcome());
        Get.snackbar(
          'succ',
          'Your account has been successfully deleted',
          snackPosition: SnackPosition.BOTTOM,
          colorText: TColors.white,
          backgroundColor: Colors.green,
          snackStyle: SnackStyle.FLOATING,
        );
      } else if (statusCode == 400) {
        Get.defaultDialog(
          title: 'Eror',
          middleText: 'Please Try Again',
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Eror',
        middleText: 'Please Try Again',
      );
    } finally {
      isLoading(false);
    }
  }

  ///////////
  ///Logout

  void logout() async {
    await box.erase();
    Get.offAll(logInScreen());
    Get.snackbar(
      'succ',
      'logOut sucss',
      snackPosition: SnackPosition.BOTTOM,
      colorText: TColors.white,
      backgroundColor: Colors.green,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
