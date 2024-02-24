import 'package:bjndiscover/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detailfasilitas_controller.dart';

class DetailfasilitasView extends GetView<DetailfasilitasController> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailfasilitasController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fasilitas'),
        backgroundColor: primaryColor,
        // centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Daftar Fasilitas',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 37,
            child: ListView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                List<String> buttonLabels = [
                  'Semua',
                  'Tempat Makan',
                  'Hotel',
                  'Tour and Travel',
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
                      for (int i = 0; i < controller.buttonColors.length; i++) {
                        if (i == index) {
                          controller.updateButtonColor(index, Colors.green);
                        } else {
                          controller.updateButtonColor(i, Colors.white);
                        }
                      }
                      // Update selected index kategori
                      controller.updateSelectedIndexKategori(index);
                      controller.filterDataByCategory(buttonLabels[index]);
                      // Get.forceAppUpdate();
                      Get.appUpdate();
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
          Expanded(
            child: Obx(
              () => Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: controller.isFetching.value
                    ? Center(child: CircularProgressIndicator())
                    : (controller.filteredData != null &&
                            controller.filteredData.isNotEmpty)
                        // ? GridView.builder(
                        //     gridDelegate:
                        //         SliverGridDelegateWithFixedCrossAxisCount(
                        //       crossAxisCount: 2,
                        //       crossAxisSpacing: 8.0,
                        //       mainAxisSpacing: 8.0,
                        //     ),
                        //     itemCount: controller.filteredData.length,
                        //     itemBuilder: (context, index) {
                        ? ListView.builder(
                            itemCount: controller.filteredData.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  // onTap: () {},
                                  contentPadding: EdgeInsets.all(8),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.filteredData[index]
                                                .nmFasilitas ??
                                            '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Icon(Icons.location_on,
                                                color: Colors.green),
                                          ),

                                          SizedBox(width: 8.0),
                                          // Teks alamat
                                          Expanded(
                                            child: Text(
                                              controller.filteredData[index]
                                                      .alamat ??
                                                  '',
                                              style: TextStyle(fontSize: 14.0),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Icon(Icons.phone_android,
                                                color: Colors.green),
                                          ),

                                          SizedBox(width: 8.0),
                                          // Teks alamat
                                          Expanded(
                                            child: Text(
                                              controller.filteredData[index]
                                                      .telepon ??
                                                  '',
                                              style: TextStyle(fontSize: 14.0),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text("Data is empty"),
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
