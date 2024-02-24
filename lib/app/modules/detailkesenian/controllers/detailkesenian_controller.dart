import 'package:bjndiscover/app/data/models/kesenian_model.dart';
import 'package:bjndiscover/app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailkesenianController extends GetxController {
  //TODO: Implement DetailkesenianController

  final count = 0.obs;
  // final count = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxList<Data> datakesenian = <Data>[].obs;
  RxBool isFetching = true.obs;

  KesenianModel? datas;

  @override
  Future<void> onInit() async {
    super.onInit();

    try {
      ApiService apiService = ApiService();
      KesenianModel? kesenianModel = await apiService.getAllKesenian();

      if (kesenianModel != null && kesenianModel.data != null) {
        datakesenian.assignAll(kesenianModel.data!);
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
