import 'package:bjndiscover/app/data/models/kuliner_model.dart';
import 'package:bjndiscover/app/services/api_services.dart';
import 'package:get/get.dart';

class DetailkulinerController extends GetxController {
  //TODO: Implement DetailkulinerController

  final count = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxList<Data> datakuliner = <Data>[].obs;
  RxBool isFetching = true.obs;

  KulinerModel? datas;
  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      ApiService apiService = ApiService();
      KulinerModel? kulinerModel = await apiService.getAllKuliner();

      if (kulinerModel != null && kulinerModel.data != null) {
        datakuliner.assignAll(kulinerModel.data!);
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
