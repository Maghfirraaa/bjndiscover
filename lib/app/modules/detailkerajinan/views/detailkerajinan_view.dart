import 'package:bjndiscover/app/data/models/kerajinan_model.dart';
import 'package:bjndiscover/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailkerajinan_controller.dart';

class DetailkerajinanView extends GetView<DetailkerajinanController> {
  const DetailkerajinanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetailkerajinanController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kerajinan Khas'),
        backgroundColor: primaryColor,
        // centerTitle: true,
      ),
      body: Obx(
        () => controller.isFetching.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.datakerajinan.length,
                itemBuilder: (context, index) {
                  final Kerajinan = controller.datakerajinan[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          '${baseApiUrl}${controller.datakerajinan[index].gambarKerajinan}' ??
                              '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  controller.datakerajinan[index].nmKerajinan ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  // textAlign: TextAlign.right,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                controller.datakerajinan[index].deskripsi ?? '',
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
