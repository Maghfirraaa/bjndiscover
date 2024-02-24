import 'package:bjndiscover/app/data/models/wisata_model.dart';
import 'package:bjndiscover/app/modules/detailwisata/views/detailwisata_view.dart';
import 'package:bjndiscover/app/modules/geotag/maps/place_source.dart';
import 'package:bjndiscover/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import '../controllers/geotag_controller.dart';

class MapWidget extends StatelessWidget {
  WisataModel? datas;
  var controller = Get.find<GeotagController>();

  MapWidget(this.datas);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          //Menampilkan halaman peta
          Container(child: PlaceSymbolBody(datas!)),
          Obx(() => controller.isChangedSrc.value
              ? CircularProgressIndicator()
              : Container(
                  margin: EdgeInsets.only(top: 500),
                  height: 300,
                  // child: ListView.builder(
                  //   // itemCount: controller.datas!.data!.length,
                  //   itemCount: controller.datas?.data?.length ?? 0,
                  //   itemBuilder: (context, index) {
                  child: controller.datas?.data == null
                      ? CircularProgressIndicator() // Handle loading state
                      : ListView.builder(
                          itemCount: controller.datas!.data!.length,
                          itemBuilder: (context, index) {
                            // Sorting
                            controller.datas!.data!.sort((a, b) {
                              double distanceA = controller.calculateDistance(
                                  controller.position?.latitude ?? 0,
                                  controller.position?.longitude ?? 0,
                                  a.latitude ?? 0,
                                  a.longitude ?? 0);
                              double distanceB = controller.calculateDistance(
                                  controller.position?.latitude ?? 0,
                                  controller.position?.longitude ?? 0,
                                  b.latitude ?? 0,
                                  b.longitude ?? 0);
                              return distanceA.compareTo(distanceB);
                            });

                            // Lakukan pengecekan jika tidak ada pencarian
                            if (controller.srcController.text == '') {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    controller.openMaps(
                                        controller.datas!.data![index].nmWisata
                                            .toString(),
                                        controller.datas!.data![index].latitude,
                                        controller
                                            .datas!.data![index].longitude);
                                  },
                                  contentPadding: EdgeInsets.all(8),
                                  title: Row(
                                    children: [
                                      // Bagian kiri (gambar)
                                      Container(
                                        width: 80,
                                        height: 80,
                                        margin: EdgeInsets.only(right: 16),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              '${baseApiUrl}${controller.datas!.data![index].gambarWisata}' ??
                                                  '',
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Bagian tengah (nmWisata dan alamatWisata)
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.datas!.data![index]
                                                      .nmWisata ??
                                                  '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  size: 20,
                                                  color:
                                                      primaryColor, // Sesuaikan dengan warna yang diinginkan
                                                ),
                                                SizedBox(height: 8),
                                                //Menghitung jarak
                                                controller.isLoading.value
                                                    ? Text(
                                                        'Calculating Distance...')
                                                    : Text(
                                                        ((controller.calculateDistance(controller.position!.latitude, controller.position!.longitude, controller.datas!.data![index].latitude, controller.datas!.data![index].longitude) /
                                                                            1000) *
                                                                        2)
                                                                    .toStringAsFixed(
                                                                        2) +
                                                                " Km" ??
                                                            '0',
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                        textAlign:
                                                            TextAlign.justify,
                                                      ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      // Bagian kanan (icon bookmark)
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              if (controller.datas!.data![index].nmWisata!
                                  .toLowerCase()
                                  .contains(controller.srcController.text
                                      .toLowerCase())) {
                                return Card(
                                  child: ListTile(
                                    onTap: () {
                                      controller.openMaps(
                                          controller
                                              .datas!.data![index].nmWisata
                                              .toString(),
                                          controller
                                              .datas!.data![index].latitude,
                                          controller
                                              .datas!.data![index].longitude);
                                    },
                                    contentPadding: EdgeInsets.all(8),
                                    title: Row(
                                      children: [
                                        // Bagian kiri (gambar)
                                        Container(
                                          width: 80,
                                          height: 80,
                                          margin: EdgeInsets.only(right: 16),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                '${baseApiUrl}${controller.datas!.data![index].gambarWisata}' ??
                                                    '',
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Bagian tengah (nmWisata dan alamatWisata)
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.datas!.data![index]
                                                        .nmWisata ??
                                                    '',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              //  SizedBox(height: 8),
                                              controller.isLoading.value
                                                  ? Text(
                                                      'Calculating Distance...')
                                                  : Text(
                                                      ((controller.calculateDistance(
                                                                              controller.position!.latitude,
                                                                              controller.position!.longitude,
                                                                              controller.datas!.data![index].latitude,
                                                                              controller.datas!.data![index].longitude) /
                                                                          1000) *
                                                                      2)
                                                                  .toStringAsFixed(2) +
                                                              "Km" ??
                                                          '0',
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                            ],
                                          ),
                                        ),
                                        // Bagian kanan (icon bookmark)
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return SizedBox();
                              }
                            }
                          },
                        ),
                )),
        ],
      ),
    );
  }
}

class GeotagView extends GetView<GeotagController> {
  @override
  Widget build(BuildContext context) {
    Get.put(GeotagController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Geotagging',
          style: TextStyle(color: Colors.white), // Text color
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        // backgroundColor: Colors.white, // Background color
        // iconTheme: IconThemeData(color: Colors.black), // Icon color
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Obx(
          () => Stack(
            children: [
              controller.isFetching.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : MapWidget(controller.datas), // Add the MapWidget here
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (value) {
                      controller.isChangedSrc.value = true;
                      controller.srcController.text = value;
                      controller.isChangedSrc.value = false;
                      print(controller.srcController.text);
                    },
                    decoration: InputDecoration(
                      labelText: 'Cari Wisata Bojonegoro',
                      filled: true, // Set filled to true
                      fillColor: Colors.white, // Set the fillColor to white
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 16.0),
                      isDense: true, // Set isDense to true
                    ),
                  ),
                  //                 TextField(
                  // onChanged: (value) {
                  //   handleSearch(value);
                  // },
                  //                 )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
