import 'package:get/get.dart';

import '../controllers/detailkesenian_controller.dart';

class DetailkesenianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailkesenianController>(
      () => DetailkesenianController(),
    );
  }
}
