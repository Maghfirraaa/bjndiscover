// detailwisata_view.dart
import 'package:bjndiscover/app/modules/detailwisata/controllers/detailwisata_controller.dart';
import 'package:bjndiscover/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bjndiscover/app/data/models/wisata_model.dart';

class DetailWisataView extends GetView<DetailwisataController> {
  // final WisataModel detailData;

  // DetailWisataView({required this.detailData});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailwisataController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        // title: Text('Detail Wisata'),
        title: Text(
          controller.detailData.nmWisata.toString(),
          style: TextStyle(
            fontSize: 18,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              '${baseApiUrl}${controller.detailData.gambarWisata}' ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              controller.detailData.nmWisata.toString(),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Icon(Icons.location_on, color: Colors.green),
                ),

                SizedBox(width: 8.0),
                // Teks alamat
                Expanded(
                  child: Text(
                    controller.detailData.alamatWisata.toString(),
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              height: 1.0,
              color: Colors.black,
            ),
            // SizedBox(height: 16.0),
            Text(
              'Deskripsi',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              controller.detailData.deskripsi.toString(),
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            Text(
              'Fasilitas',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              controller.detailData.fasilitas.toString(),
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            Text(
              'Informasi Lainnya',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Jam Operasional : ${controller.detailData.jamOperasional}',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              'Telepon : ${controller.detailData.telepon}',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              'Harga Tiket : ${controller.detailData.hrgTiket}',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
