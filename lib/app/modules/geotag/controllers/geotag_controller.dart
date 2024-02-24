import 'package:bjndiscover/app/components/map_sheet.dart';
import 'package:bjndiscover/app/data/models/wisata_model.dart';
import 'package:bjndiscover/app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';

class GeotagController extends GetxController {
  //TODO: Implement GeotagController

  // late MapboxMapController mapController;

  TextEditingController srcController = TextEditingController();
  RxString srcString = ''.obs;
  RxBool isChangedSrc = false.obs;

  final count = 0.obs;
  Position? position;
  RxBool isLoading = true.obs;
  WisataModel? datas;
  RxBool isFetching = true.obs;
  final double defaultZoom = 13.0; // Tingkat zoom awal
  late MapController mapController;
  final RxString searchQuery = ''.obs;
  // List to store filtered markers
  final RxList<Marker> filteredMarkers = <Marker>[].obs;
  late Box<Map<String, dynamic>> favoriteBox;

  @override
  void onInit() async {
    super.onInit();
    var service = ApiService();
    datas = await service.getAllWisata();

    loadLokasi();

    isFetching.value = false;
    //  mapController = MapController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  double calculateDistance(
      double lat1, double lon1, double? lat2, double? lon2) {
    return Geolocator.distanceBetween(lat1, lon1, lat2!, lon2!);
  }

  void loadLokasi() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    isLoading.value = false;
    print("long = " + position!.longitude.toString());
    print("lat = " + position!.latitude.toString());
  }

  void openMaps(String title, double? latitude, double? longitude) {
    MapsSheet.show(
      onMapTap: (map) {
        map.showDirections(
          destination: Coords(latitude!, longitude!),
          destinationTitle: title,
          origin: Coords(position!.latitude, position!.longitude),
          originTitle: "Posisi Saat ini",
          directionsMode: DirectionsMode.driving,
        );
      },
    );
    print("maps dibukaa");
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

  //Kode tambahan untuk search

  void increment() => count.value++;
}
