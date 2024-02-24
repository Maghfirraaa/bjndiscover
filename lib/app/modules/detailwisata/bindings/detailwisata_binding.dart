import 'package:get/get.dart';

import '../controllers/detailwisata_controller.dart';

class DetailwisataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailwisataController>(
      () => DetailwisataController(),
    );
    // Get.lazyPut(() => DetailwisataController());
  }
}
