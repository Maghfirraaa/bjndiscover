import 'dart:ui';

import 'package:bjndiscover/app/data/models/fasilitas_model.dart';
import 'package:bjndiscover/app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailfasilitasController extends GetxController {
  //TODO: Implement DetailfasilitasController

  final count = 0.obs;
  RxBool isFetching = true.obs;
  RxInt selectedIndexKategori = 0.obs;
  RxList<Data> filteredData = <Data>[].obs;
  FasilitasModel? datas;

  @override
  Future<void> onInit() async {
    super.onInit();
    ApiService coba = ApiService();
    datas = await coba.getAllFasilitas();
    print('Data Fasilitas: $datas'); // Tambahkan baris ini
    isFetching.value = false;
    filterDataByCategory('Semua');
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  List<Color> buttonColors = List<Color>.filled(4, Colors.white);
  int? lastClickedIndex;

  // Method untuk memperbarui selected index kategori
  void updateSelectedIndexKategori(int index) {
    selectedIndexKategori.value = index;
  }

  /// Fungsi untuk memperbarui warna tombol
  void updateButtonColor(int index, Color color) {
    buttonColors[index] = color;
    update();
  }

  void filterDataByCategory(String category) {
    try {
      isFetching.value = true;
      filteredData.clear();

      if (datas != null && datas!.data != null) {
        if (category == 'Semua') {
          filteredData.assignAll(datas!.data!);
        } else {
          // Menggunakan .where untuk menyaring data berdasarkan kategori
          List<Data> filteredResult = datas!.data!
              .where((item) => item.kategori == '$category')
              .toList();
          filteredData.assignAll(filteredResult);
        }
      } else {
        print('Data is null or empty');
      }
    } catch (error) {
      print('Error filtering data: $error');
    } finally {
      isFetching.value = false;
    }
  }
}
