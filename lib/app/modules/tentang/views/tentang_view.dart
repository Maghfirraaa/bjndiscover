import 'package:bjndiscover/app/modules/tentang/controllers/tentang_controller.dart';
import 'package:bjndiscover/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TentangView extends GetView<TentangController> {
  const TentangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Tentang'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 4.0),
                    child: Row(children: [
                      // Icon penanda lokasi
                      Icon(
                        Icons.public,
                        size: 30,
                        color: primaryColor,
                      ),
                      SizedBox(width: 8),
                      // Teks alamat lengkap wisata
                      Text(
                        'Aplikasi Wisata Bojonegoro',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                Container(
                  margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "Aplikasi ini merupakan aplikasi yang menghadirkan informasi dan inspirasi tentang tempat-tempat menakjubkan di Kabupaten Bojonegoro.",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Row(children: [
                      // Icon penanda lokasi
                      Icon(
                        Icons.rocket,
                        size: 30,
                        color: primaryColor,
                      ),
                      SizedBox(width: 8),
                      // Teks alamat lengkap wisata
                      Text(
                        'Tujuan Aplikasi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                Container(
                  margin: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Text(
                    "Aplikasi ini diciptakan untuk memberikan informasi untuk mengenalkan wisata serta mempermudah pengguna dalam menemukan dan mengeksplorasi keindahan alam dan budaya Bojonegoro.",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Row(children: [
                      // Icon penanda lokasi
                      Icon(
                        Icons.search,
                        size: 30,
                        color: primaryColor,
                      ),
                      SizedBox(width: 8),
                      // Teks alamat lengkap wisata
                      Text(
                        'Fitur Utama',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),

                //konten nomor 2
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Informasi 1
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              margin: EdgeInsets.only(top: 8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                "Pemetaan Lokasi Wisata : Temukan lokasi dengan mudah melalui peta interaktif.",
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),

                        // Informasi 2
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              margin: EdgeInsets.only(top: 8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                "Informasi Detail : Dapatkan informasi lengkap tentang tempat wisata.",
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),

                        // Informasi 3
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              margin: EdgeInsets.only(top: 8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                "Navigasi: Rencanakan perjalanan dengan bantuan navigasi terintegrasi.",
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),

                Container(
                    margin: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                    child: Row(children: [
                      // Icon penanda lokasi
                      Icon(
                        Icons.email,
                        size: 30,
                        color: primaryColor,
                      ),
                      SizedBox(width: 8),
                      // Teks alamat lengkap wisata
                      Text(
                        'Hubungi Kami',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),

                Container(
                  margin: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Text(
                    "Jika Anda memiliki pertanyaan, saran, atau ingin berbicara, silakan hubungi kami melalui : email di disbudpar@bojonegorokab.go.id",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
