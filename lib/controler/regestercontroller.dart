import 'package:detest/model/usermoder.dart';
import 'package:detest/service/regesterapi.dart';
import 'package:detest/view/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Regestercontroller extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;
  var country_code = ''.obs;
  var password_confirm = ''.obs;
  final hidepasword = false.obs;
  final hideCpasword = false.obs;

  var isLoading = false.obs;
  final box = GetStorage();

  Future<void> Regrster() async {
    final RegesterapiService apiService = RegesterapiService();
    isLoading(true);

    try {
      var response = await apiService.Regrster(
          name.value,
          email.value,
          phone.value,
          password.value,
          country_code.value,
          password_confirm.value);
      int statusCode = response['statusCode'];
      User? user = response['user'];
      String? messge = response['message'];

      if (statusCode == 201 && user != null) {
        box.write('user', user.toJson());
        box.write('log', 1);

        Get.offAll(Homescreen());
      } else {
        Get.defaultDialog(
          title: 'Sory',
          middleText: messge as String,
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Eror',
        middleText: 'Please try again later',
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
