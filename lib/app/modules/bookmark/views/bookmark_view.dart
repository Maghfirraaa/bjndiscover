import 'package:bjndiscover/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../detailwisata/views/detailwisata_view.dart';
import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: const Text(
            "Bookmark",
            style: TextStyle(color: Colors.white),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: controller.isFetching.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.datas!.data!.length,
                    itemBuilder: (context, index) {
                      if (controller.isFavorite(
                          controller.datas!.data![index].nmWisata.toString())) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(() => DetailWisataView(),
                                  arguments: controller.datas!.data![index]);
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
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
                                        controller
                                                .datas!.data![index].nmWisata ??
                                            '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        controller.datas!.data![index]
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
                                            .datas!.data![index].nmWisata ??
                                        '');
                                    Get.forceAppUpdate();
                                  },
                                  icon: Stack(
                                    children: [
                                      // Ikon utama (berisi warna putih)
                                      Icon(
                                        Icons.bookmark,
                                        color: controller.isFavorite(controller
                                                    .datas!
                                                    .data![index]
                                                    .nmWisata ??
                                                '')
                                            ? primaryColor
                                            : Colors.grey,
                                      ),
                                      // Ikon tepi (berisi garis hitam tipis)
                                      Positioned.fill(
                                        child: Icon(
                                          Icons.bookmark,
                                          color: controller.isFavorite(
                                                  controller.datas!.data![index]
                                                          .nmWisata ??
                                                      '')
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
                      } else {
                        return SizedBox();
                      }
                    },
                  )),
      ),
    );
  }
}
