import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran/app/controller/surah_controller.dart';
import 'package:quran/app/routes/app_routes.dart';
import '../models/surah_model.dart';

class Quran extends StatelessWidget {
  const Quran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SurahController controller = Get.put(SurahController());

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          title: const Text(
            'List of Surah',
          ),
          toolbarHeight: 70.0,
        ),
        body: Obx(() {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 16.0,
            ),
            children: [
              if (controller.surahs.isNotEmpty)
                ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: controller.surahs.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    SurahModel surah = controller.surahs[index];
                    print("surah ${surah.number}");
                    return Card(
                      elevation: 3.0,
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.blue.shade50,
                      child: ListTile(
                        leading: Stack(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade900,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                                border: Border.all(
                                  color: Colors.blue.shade900,
                                  width: 1,
                                ),
                              ),
                            ),
                            Transform.rotate(
                              angle: pi / 1.3,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.blue.shade900,
                                    width: 6,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                                border: Border.all(
                                  color: Colors.blue.shade900,
                                  width: 1,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  surah.number.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          surah.englishName,
                        ),
                        subtitle: Row(
                          children: [
                            Expanded(
                              child: Text(
                                surah.englishNameTranslation,
                              ),
                            ),
                            const VerticalDivider(
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Text(
                                '${surah.numberOfAyahs.toString()} Ayah',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          surah.name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.ayahDetail,
                            arguments: {
                              'id': surah.number,
                              'name': surah.name,
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              if (controller.surahs.isEmpty)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        }),
      ),
    );
  }
}
