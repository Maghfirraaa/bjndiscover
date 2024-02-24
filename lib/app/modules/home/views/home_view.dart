import 'package:bjndiscover/app/modules/detailfasilitas/views/detailfasilitas_view.dart';
import 'package:bjndiscover/app/modules/detailkerajinan/views/detailkerajinan_view.dart';
import 'package:bjndiscover/app/modules/detailkesenian/views/detailkesenian_view.dart';
import 'package:bjndiscover/app/modules/detailkuliner/views/detailkuliner_view.dart';
import 'package:bjndiscover/app/modules/detailwisata/views/detailwisata_view.dart';
import 'package:bjndiscover/app/modules/geotag/maps/utama.dart';
import 'package:bjndiscover/app/modules/geotag/views/geotag_view.dart';
import 'package:bjndiscover/app/modules/home/controllers/home_controller.dart';
import 'package:bjndiscover/app/modules/tentang/views/tentang_view.dart';
import 'package:bjndiscover/app/routes/app_pages.dart';
import 'package:bjndiscover/app/services/api_services.dart';
import 'package:bjndiscover/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  final PageController _pageController = PageController(initialPage: 0);
  // int selectedIndexKategori = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    // Get.to(() => GeotagView());
                    // Get.to(() => MapsDemo());
                    Get.to(() => GeotagView());
                    print('Container diklik!');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    child: Center(
                      child: Image.asset('images/geo.png'),
                    ),
                  ))
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'See Geotagging',
              style: styleUtama.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Pariwisata',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                List<String> imagePaths = [
                  'images/kesenian.png',
                  'images/kerajinan.png',
                  'images/kuliner.png',
                  'images/fasilitas.png',
                ];

                List<String> titles = [
                  'Kesenian Khas',
                  'Kerajinan Khas',
                  'Kuliner Khas',
                  'Fasilitas',
                ];

                return Padding(
                  padding: EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman yang sesuai dengan index
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            switch (index) {
                              case 0:
                                return DetailkesenianView();
                              case 1:
                                return DetailkerajinanView();
                              case 2:
                                return DetailkulinerView();
                              case 3:
                                return DetailfasilitasView();
                              default:
                                return TentangView(); // Default jika indeks tidak sesuai
                            }
                          },
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: 120,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(imagePaths[index]),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              titles[index],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Tempat Wisata',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 37,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) {
                List<String> buttonLabels = [
                  'Semua',
                  'Alam',
                  'Buatan',
                  'Agro',
                  'Edukasi',
                  'Religi',
                  'Kerajinan',
                  'Air',
                  'Sejarah',
                  'Kuliner',
                  'Budaya',
                  'Geopark',
                ];

                // Dapatkan nilai oldIndex dari controller
                int oldIndex = controller.selectedIndexKategori.value;

                // Jika oldIndex null, atur nilai oldIndex sesuai dengan index yang dipilih
                if (oldIndex == null) {
                  oldIndex =
                      0; // Atur ke 'Semua' saat aplikasi pertama kali dijalankan
                }

                // Periksa apakah ini adalah tombol yang dipilih
                bool isSelected = index == oldIndex;

                return Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Perbarui warna tombol
                      for (int i = 0; i < controller.buttonColors.length; i++) {
                        if (i == index) {
                          controller.updateButtonColor(index, Colors.green);
                        } else {
                          controller.updateButtonColor(i, Colors.white);
                        }
                      }
                      // Update selected index kategori
                      controller.updateSelectedIndexKategori(index);
                      // Filter data berdasarkan kategori yang dipilih
                      controller.filterDataByCategory(buttonLabels[index]);
                      Get.forceAppUpdate();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          // Jika tombol ini yang dipilih, atur warna hijau
                          if (isSelected) {
                            return Colors.green;
                          }
                          // Jika tidak, atur warna putih
                          return Colors.white;
                        },
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          // Jika tombol ini yang dipilih, atur warna teks putih
                          return isSelected ? Colors.white : Colors.green;
                        },
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide(color: Colors.green),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(51, 37)),
                    ),
                    child: Text(
                      buttonLabels[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Obx(
            () => Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              height: 250,
              child: controller.isFetching.value
                  ? Center(child: CircularProgressIndicator())
                  : (controller.filteredData != null &&
                          controller.filteredData.isNotEmpty)
                      ? ListView.builder(
                          itemCount: controller.filteredData.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  Get.to(() => DetailWisataView(),
                                      arguments:
                                          controller.filteredData[index]);
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
                                            '${baseApiUrl}${controller.filteredData[index].gambarWisata}' ??
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
                                            controller.filteredData[index]
                                                    .nmWisata ??
                                                '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            controller.filteredData[index]
                                                    .alamatWisata ??
                                                '',
                                            style: TextStyle(fontSize: 14),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Bagian kanan (icon bookmark)
                                    IconButton(
                                      onPressed: () {
                                        controller.toggleFavorite(controller
                                            .filteredData[index].nmWisata
                                            .toString());
                                        Get.forceAppUpdate(); // Menyebabkan GetX untuk memperbarui tampilan
                                      },
                                      icon: Stack(
                                        children: [
                                          // Ikon utama (berisi warna putih)
                                          Icon(
                                            Icons.bookmark,
                                            color: controller.isFavorite(
                                                    controller
                                                        .filteredData[index]
                                                        .nmWisata
                                                        .toString())
                                                ? primaryColor
                                                : Colors.grey,
                                            size: 30.0,
                                          ),
                                          // Ikon tepi (berisi garis hitam tipis)
                                          Positioned.fill(
                                            child: Icon(
                                              Icons.bookmark,
                                              color: controller.isFavorite(
                                                      controller
                                                          .filteredData[index]
                                                          .nmWisata
                                                          .toString())
                                                  ? primaryColor
                                                  : Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Text("Data is empty"),
            ),
          ),
        ],
      ),
    );
  }
}
