import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quran/app/helper/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/surah_model.dart';

class OnboardController extends GetxController {

  DatabaseHelper databaseHelper = DatabaseHelper();
  late SharedPreferences prefs;
  RxString boolKey = RxString('');

  Future<List<SurahModel>?> getSurah() async {
    var result = await Dio().get("http://api.alquran.cloud/v1/surah");
    try{
      if (result.statusCode == 200) {
        for(var e in result.data['data']){
          SurahModel surahModel = SurahModel.fromJson(e);
          databaseHelper.insertSurah(surahModel);
        }
      }
    }
    catch(e){
      throw Exception('Failed to load surah!');

    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      prefs = Get.arguments['prefs'];
      boolKey.value = Get.arguments['boolKey'];
    }
    getSurah();
  }

}