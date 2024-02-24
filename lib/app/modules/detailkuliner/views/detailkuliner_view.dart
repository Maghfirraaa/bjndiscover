import 'package:bjndiscover/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailkuliner_controller.dart';

class DetailkulinerView extends GetView<DetailkulinerController> {
  const DetailkulinerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetailkulinerController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuliner Khas'),
        backgroundColor: primaryColor,
        // centerTitle: true,
      ),
      body: Obx(
        () => controller.isFetching.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.datakuliner.length,
                itemBuilder: (context, index) {
                  final Kesenian = controller.datakuliner[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          '${baseApiUrl}${controller.datakuliner[index].gambarKuliner}' ??
                              '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        // Image.network(
                        //   'https://1079-103-17-76-24.ngrok-free.app/${controller.datakuliner[index].gambarKuliner}' ??
                        //       '',
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  controller.datakuliner[index].nmKuliner ?? '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                controller.datakuliner[index].deskripsi ?? '',
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
