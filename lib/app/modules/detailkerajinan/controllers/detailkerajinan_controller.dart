import 'package:bjndiscover/app/data/models/kerajinan_model.dart';
import 'package:bjndiscover/app/services/api_services.dart';
import 'package:get/get.dart';

class DetailkerajinanController extends GetxController {
  //TODO: Implement DetailkerajinanController

  final count = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxList<Data> datakerajinan = <Data>[].obs;
  RxBool isFetching = true.obs;

  KerajinanModel? datas;
  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      ApiService apiService = ApiService();
      KerajinanModel kerajinanModel = await apiService.getAllKerajinan();

      if (KerajinanModel != null && kerajinanModel.data != null) {
        datakerajinan.assignAll(kerajinanModel.data!);
      }

      isFetching.value = false;
    } catch (error) {
      print('Error fetching data: $error');
      isFetching.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
