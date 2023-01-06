import 'package:get/get.dart';
import 'package:quran/app/routes/app_routes.dart';
import 'package:quran/app/screens/ayah_detail.dart';
import 'package:quran/app/screens/home_screen.dart';
import 'package:quran/app/screens/quran.dart';
import 'package:quran/app/screens/splash.dart';
import '../screens/onboard.dart';

class AppPages {

  static List<GetPage> getPages = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.onboard,
      page: () => const OnBoarding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.quran,
      page: () =>  const Quran(),
    ),
    GetPage(
      name: AppRoutes.ayahDetail,
      page: () =>  const AyahDetail(),
    ),
  ];
}
