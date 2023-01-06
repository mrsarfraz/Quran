import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_routes.dart';

class SplashController extends GetxController {

  var prefs;
  RxString boolKey = RxString('isFirstTime');
  RxBool isFirstTime = RxBool(true);

  void isFirst() async {
    prefs = await SharedPreferences.getInstance();
    isFirstTime.value = prefs.getBool(boolKey.value) ?? true;

    if (isFirstTime.value) {
      Get.toNamed(
        AppRoutes.onboard,
        arguments: {
          'prefs': prefs,
          'boolKey': boolKey.value,
        },
      );
    } else {
      Get.toNamed(AppRoutes.quran);
    }
  }
}