import 'package:get/get.dart';

import '../controllers/detailkuliner_controller.dart';

class DetailkulinerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailkulinerController>(
      () => DetailkulinerController(),
    );
  }
}
