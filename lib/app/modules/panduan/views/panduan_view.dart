import 'package:bjndiscover/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/panduan_controller.dart';

class PanduanView extends GetView<PanduanController> {
  const PanduanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Align(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Panduan Aplikasi",
              style: TextStyle(color: Colors.white),
            ),
          ),
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
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Selamat datang di Aplikasi Wisata Bojonegoro!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                //Nomor 1
                Container(
                  margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "Aplikasi ini membantu Anda untuk mengenalkan serta menjelajahi lokasi wisata di Kabupaten Bojonegoro dengan mudah. Di bawah ini adalah beberapa fitur utama yang dapat Anda manfaatkan:",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "1. Navigasi dengan Peta Interaktif",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "Ketuk ikon peta di halaman home untuk melihat lokasi persebaran wisata Bojonegoro dengan lebih jelas.",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
                //Menampilkan gambar geotagging
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      child: Center(
                        child: Image.asset('images/geo.png'),
                      ),
                    )
                  ],
                ),

                //Lanjut panduan no.2
                Container(
                  margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "2. Informasi Koordinat Geografis",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                //konten nomor 2
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                              "Setiap tempat wisata memiliki informasi koordinat geografis (latitude dan longitude).",
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
                              "Anda dapat mengetuk tiap tanda lokasi wisata untuk melihat informasi ini.",
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),

                      //Menampilkan card dari tiap titik wisata
                      Card(
                        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          title: Row(
                            children: [
                              // Bagian kiri (gambar)
                              Container(
                                width: 80,
                                height: 80,
                                margin: EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/kesenian.png'),
                                  ),
                                ),
                              ),
                              // Bagian tengah (nmWisata dan alamatWisata)
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nama Wisata",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),

                                    SizedBox(height: 8),
                                    //alamat lengkap
                                    Row(children: [
                                      // Icon penanda lokasi
                                      Icon(
                                        Icons.location_on,
                                        size: 20,
                                        color:
                                            primaryColor, // Sesuaikan dengan warna yang diinginkan
                                      ),
                                      SizedBox(height: 8),
                                      // Teks alamat lengkap wisata
                                      Expanded(
                                        child: Text(
                                          "Alamat wisata",
                                          style: TextStyle(fontSize: 14),
                                          textAlign: TextAlign.justify,
                                        ),
                                      )
                                    ])
                                  ],
                                ),
                              ),
                              // Bagian kanan (icon bookmark)
                              IconButton(
                                icon: Icon(Icons.bookmark),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Lanjut panduan no.3
                Container(
                  margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "3. Informasi Lengkap Wisata",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                //konten nomor 2
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                              "Setiap tempat wisata memiliki informasi lengkap yang ditampilkan.",
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
                              "Anda dapat mengetuk card mengenai masing-masing wisata untuk mendapatkan informasi detail wisata.",
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
                              "Anda juga dapat mengaksesnya dengan klik Informasi selanjurnya pada card yang ditampilkan di peta persebaran wisata.",
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //Lanjut panduan no.4
                Container(
                  margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "4. Cari Tempat Wisata",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                //konten nomor 2
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                              "Gunakan fitur pencarian pada halaman peta interaktif untuk menemukan tempat wisata dengan cepat.",
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
