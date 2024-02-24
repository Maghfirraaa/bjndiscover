import 'package:get/get.dart';

import '../controllers/detailkerajinan_controller.dart';

class DetailkerajinanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailkerajinanController>(
      () => DetailkerajinanController(),
    );
  }
}
