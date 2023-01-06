import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quran/app/routes/app_routes.dart';

import '../controller/onboard_controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    OnboardController controller = Get.put(OnboardController());
    controller.prefs.setBool(controller.boolKey.value, false);

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Read Quran",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Customize your reading view,\n"
                  "read multiple language,\n"
                  "listen different audio.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          image: Image.asset("assets/images/quran.png"),
        ),
        PageViewModel(
          title: "Read Quran",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Customize your reading view,\n"
                  "read multiple language,\n"
                  "listen different audio.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          image: Image.asset("assets/images/quran.png"),
        ),
        PageViewModel(
          title: "Read Quran",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Customize your reading view,\n"
                  "read multiple language,\n"
                  "listen different audio.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          image: Image.asset("assets/images/quran.png"),
        ),
      ],
      showSkipButton: true,
      skip: const Text(
        'Skip',
      ),
      next: const Text(
        "Next",
      ),
      done: const Text(
        "Done",
        style: TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
      onDone: () {
        Get.toNamed(
          AppRoutes.quran,
        );
      },
      onSkip: () {
        Get.toNamed(
          AppRoutes.quran,
        );
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}