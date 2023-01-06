import 'package:get/get.dart';
import 'package:quran/app/helper/database_helper.dart';
import '../models/surah_model.dart';

class SurahController extends GetxController {
  DatabaseHelper databaseHelper = DatabaseHelper();
  final RxList<SurahModel> surahs = RxList();

  @override
  void onInit() {
    super.onInit();
    updateList();
  }

  void updateList() async{
    List<SurahModel> surahListFuture = await databaseHelper.getSurahList();
    surahs.addAll(surahListFuture);
  }
}
