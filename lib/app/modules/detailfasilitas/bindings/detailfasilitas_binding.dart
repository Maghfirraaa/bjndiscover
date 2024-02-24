import 'package:get/get.dart';

import '../controllers/detailfasilitas_controller.dart';

class DetailfasilitasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailfasilitasController>(
      () => DetailfasilitasController(),
    );
  }
}
