import 'package:bjndiscover/app/data/models/wisata_model.dart';
import 'package:bjndiscover/app/services/api_services.dart';
import 'package:get/get.dart';

class DetailwisataController extends GetxController {
  //TODO: Implement DetailwisataController

  var data = Data().obs;
  WisataModel? datas;
  final count = 0.obs;
  RxDouble gambarWisata = 0.0.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString deskripsi = ''.obs;
  RxString fasilitas = ''.obs;
  final RxString namaWisata = ''.obs;
  final Data detailData = Get.arguments;
  RxList<Data> filteredData = <Data>[].obs;

  RxList<WisataModel> listWisata = <WisataModel>[].obs;

  // // Metode untuk mendapatkan data wisata berdasarkan ID
  // WisataModel getWisataById(String id) {
  //   return listWisata.firstWhere((wisata) => wisata.id == id, orElse: () => WisataModel());
  // }

  @override
  void onInit() {
    super.onInit();
    // Ambil data dari arguments
    var arguments = Get.arguments;
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
