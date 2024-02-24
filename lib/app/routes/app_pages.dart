import 'package:get/get.dart';

import '../modules/bookmark/bindings/bookmark_binding.dart';
import '../modules/bookmark/views/bookmark_view.dart';
import '../modules/detailfasilitas/bindings/detailfasilitas_binding.dart';
import '../modules/detailfasilitas/views/detailfasilitas_view.dart';
import '../modules/detailkerajinan/bindings/detailkerajinan_binding.dart';
import '../modules/detailkerajinan/views/detailkerajinan_view.dart';
import '../modules/detailkesenian/bindings/detailkesenian_binding.dart';
import '../modules/detailkesenian/views/detailkesenian_view.dart';
import '../modules/detailkuliner/bindings/detailkuliner_binding.dart';
import '../modules/detailkuliner/views/detailkuliner_view.dart';
import '../modules/detailwisata/bindings/detailwisata_binding.dart';
import '../modules/detailwisata/views/detailwisata_view.dart';
import '../modules/geotag/bindings/geotag_binding.dart';
import '../modules/geotag/views/geotag_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/bottom.dart';
import '../modules/home/views/home_view.dart';
import '../modules/panduan/bindings/panduan_binding.dart';
import '../modules/panduan/views/panduan_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tentang/bindings/tentang_binding.dart';
import '../modules/tentang/views/tentang_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      // page: () => SplashScreen(),
      page: () => Bottom(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOOKMARK,
      page: () => BookmarkView(),
      binding: BookmarkBinding(),
    ),
    GetPage(
      name: _Paths.PANDUAN,
      page: () => PanduanView(),
      binding: PanduanBinding(),
    ),
    GetPage(
      name: _Paths.TENTANG,
      page: () => TentangView(),
      binding: TentangBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DETAILWISATA,
      page: () => DetailWisataView(),
      binding: DetailwisataBinding(),
    ),
    GetPage(
      name: _Paths.DETAILKESENIAN,
      page: () => const DetailkesenianView(),
      binding: DetailkesenianBinding(),
    ),
    GetPage(
      name: _Paths.DETAILKERAJINAN,
      page: () => const DetailkerajinanView(),
      binding: DetailkerajinanBinding(),
    ),
    GetPage(
      name: _Paths.DETAILKULINER,
      page: () => const DetailkulinerView(),
      binding: DetailkulinerBinding(),
    ),
    GetPage(
      name: _Paths.GEOTAG,
      page: () => GeotagView(),
      binding: GeotagBinding(),
    ),
    GetPage(
      name: _Paths.DETAILFASILITAS,
      page: () => DetailfasilitasView(),
      binding: DetailfasilitasBinding(),
    ),
  ];
}
