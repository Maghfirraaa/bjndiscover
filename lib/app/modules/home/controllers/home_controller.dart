import 'package:bjndiscover/app/data/models/wisata_model.dart';
import 'package:bjndiscover/app/modules/bookmark/views/bookmark_view.dart';
import 'package:bjndiscover/app/modules/home/views/home_view.dart';
import 'package:bjndiscover/app/modules/panduan/views/panduan_view.dart';
import 'package:bjndiscover/app/modules/tentang/views/tentang_view.dart';
import 'package:bjndiscover/app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController

  TabController? tabController;

  final count = 0.obs;
  RxInt selectedIndex = 0.obs;
  // var selectedIndexKategori = 0.obs;
  RxInt selectedIndexKategori = 0.obs; // Gunakan .obs untuk membuatnya reactive
  RxList<Data> filteredData = <Data>[].obs;
  RxBool isFetching = true.obs;

  WisataModel? datas;

  late Box<Map<String, dynamic>> favoriteBox;

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(
      length: widgetOptions.length,
      vsync: this,
    );
    openFavoriteBox();
    ApiService coba = ApiService();
    datas = await coba.getAllWisata();
    isFetching.value = false;
    filterDataByCategory('Semua');

    //warna buttoblabel
    for (int i = 0; i < buttonColors.length; i++) {
      buttonColors[i] = Colors.white;
    }
    lastClickedIndex = null;
  }

  void toggleFavorite(String wisataName) {
    if (favoriteBox.containsKey(wisataName)) {
      // If the item is already in favorites, remove it
      favoriteBox.delete(wisataName);
      Get.snackbar('Notifikasi', '$wisataName, telah dihapus dari favorite');
    } else {
      // If the item is not in favorites, add it
      favoriteBox.put(wisataName, {'name': wisataName});
      Get.snackbar(
          'Notifikasi', '$wisataName, telah ditambahkan dari favorite');
    }
    // Update the UI
    update();
  }

  bool isFavorite(String wisataName) {
    return favoriteBox.containsKey(wisataName);
  }

  void openFavoriteBox() async {
    await Hive.openBox<Map<String, dynamic>>('favorites');
    favoriteBox = Hive.box<Map<String, dynamic>>('favorites');
  }

  List<Color> buttonColors = List<Color>.filled(12, Colors.white);
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
              .where((item) => item.kategori == 'Wisata $category')
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

  void changeTab(int index) {
    selectedIndex.value = index;
    tabController!.animateTo(index);
  }

  final List<Widget> widgetOptions = <Widget>[
    HomeView(),
    BookmarkView(),
    PanduanView(),
    TentangView()
  ];

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
