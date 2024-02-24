import 'package:bjndiscover/app/data/models/wisata_model.dart';
import 'package:bjndiscover/app/services/api_services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class BookmarkController extends GetxController {
  //TODO: Implement BookmarkController

  final count = 0.obs;

  RxBool isFetching = true.obs;

  WisataModel? datas;
  WisataModel? listBookmark;
  late Box<Map<String, dynamic>> favoriteBox;
  @override
  void onInit() async {
    super.onInit();
    openFavoriteBox();
    ApiService coba = ApiService();
    datas = await coba.getAllWisata();
    isFetching.value = false;
  }

  void openFavoriteBox() async {
    await Hive.openBox<Map<String, dynamic>>('favorites');
    favoriteBox = Hive.box<Map<String, dynamic>>('favorites');
  }

  void toggleFavorite(String wisataName) {
    if (favoriteBox.containsKey(wisataName)) {
      // If the item is already in favorites, remove it
      favoriteBox.delete(wisataName);
    } else {
      // If the item is not in favorites, add it
      favoriteBox.put(wisataName, {'name': wisataName});
    }

    // Update the UI
    update();
  }

  bool isFavorite(String wisataName) {
    return favoriteBox.containsKey(wisataName);
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
