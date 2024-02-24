import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool isVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 10), () {
      isVisible.value = true;
    });
  }
}
