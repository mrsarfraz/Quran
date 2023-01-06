import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quran/app/controller/ayah_controller.dart';
import 'package:quran/app/models/surah_model.dart';

class AyahDetail extends StatelessWidget {
  const AyahDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AyahController controller = Get.put(AyahController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        title: Text(
          controller.name.value,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 70.0,
      ),
      body: Obx(() {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16.0,
          ),
          children: [
            if (controller.ayah.isNotEmpty)
              ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: controller.ayah.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  AyahModel ayahs = controller.ayah[index];
                  return Card(
                    color: Colors.blue.shade50,
                    child: Container(
                        margin: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: ListTile(
                          trailing: Stack(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                  color: Colors.blue.shade900,
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
                                    '${index + 1}',
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
                            ayahs.text,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontFamily: 'Noorehira',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  FlutterClipboard.copy(ayahs.text)
                                      .then((value) {
                                    Get.snackbar(
                                      'Copy',
                                      'Your selected text Copied!',
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  });
                                },
                                icon: const Icon(
                                  Icons.copy,
                                ),
                              ),
                              FavoriteButton(
                                iconSize: 40.0,
                                iconColor: Colors.blue.shade900,
                                isFavorite: false,
                                valueChanged: (_isFavorite) {
                                  print('Is Favorite : $_isFavorite');
                                },
                              ),
                              IconButton(
                                onPressed: () {
                                  FlutterShare.share(
                                    text: ayahs.text,
                                    title: ayahs.number.toString(),
                                  );
                                },
                                icon: const Icon(
                                  Icons.share,
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                },
              ),
            if (controller.ayah.isEmpty)
              const Align(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator()),
          ],
        );
      }),
    );
  }
}
