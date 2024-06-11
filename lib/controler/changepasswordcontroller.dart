import 'package:detest/model/usermoder.dart';
import 'package:detest/service/changepasswordService.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Changepasswordcontroller extends GetxController {
  var password = ''.obs;
  var password_confirm = ''.obs;
  var current_password = ''.obs;
  final hidepasword = false.obs;
  final hidepConfasword = false.obs;

  final hideCupasword = false.obs;

  var isLoading = false.obs;
  final box = GetStorage();

  Future<void> changepass(String token) async {
    final Changepasswordservice apiService = Changepasswordservice();
    isLoading(true);

    try {
      var response = await apiService.changepass(token, current_password.value,
          password.value, password_confirm.value);
      int statusCode = response['statusCode'];

      if (statusCode == 200) {
        Get.back();
      } else if (statusCode == 400) {
        Get.defaultDialog(
          title: 'Sory',
          middleText: 'Your password is Uncorrect',
        );
      } else if (statusCode == 500) {
        Get.defaultDialog(
          title: 'Sory',
          middleText: 'password does not match',
        );
      } else {
        Get.defaultDialog(
          title: 'Sory'.tr,
          middleText: 'Please try again',
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'ُEror',
        middleText: 'Please try again'.tr,
      );
    } finally {
      isLoading(false);
    }
  }

  User? getUser() {
    Map<String, dynamic>? userData = box.read('user');
    if (userData != null) {
      return User.fromJson(userData);
    }
    return null;
  }
}
