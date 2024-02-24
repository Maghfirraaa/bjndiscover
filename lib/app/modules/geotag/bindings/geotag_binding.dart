import 'package:get/get.dart';

import '../controllers/geotag_controller.dart';

class GeotagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeotagController>(
      () => GeotagController(),
    );
  }
}
