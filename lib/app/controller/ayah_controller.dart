import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quran/app/helper/database_helper.dart';
import 'package:quran/app/models/surah_model.dart';

class AyahController extends GetxController {

  DatabaseHelper databaseHelper = DatabaseHelper();
  final RxList<AyahModel> ayah = RxList();

  RxInt id = RxInt(0);
  RxString name = RxString('');

  Future<List<AyahModel>> getSurahDetail(int id) async {
    var result = await Dio().get("http://api.alquran.cloud/v1/surah/$id");
    if (result.statusCode == 200) {
      for(var e in result.data['data']['ayahs']){
        AyahModel ayahModel = AyahModel.fromJson(e);
        ayah.add(ayahModel);
      }
      return ayah;
    }
    throw Exception('Failed to load surah detail!');
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      id.value = Get.arguments['id'];
      name.value = Get.arguments['name'];
    }
       getSurahDetail(id.value);
  }
}
