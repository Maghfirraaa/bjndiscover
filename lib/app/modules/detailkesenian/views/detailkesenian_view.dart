import 'package:bjndiscover/app/data/models/kesenian_model.dart';
import 'package:bjndiscover/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailkesenian_controller.dart';

class DetailkesenianView extends GetView<DetailkesenianController> {
  const DetailkesenianView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailkesenianController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kesenian Khas'),
        backgroundColor: primaryColor,

        // centerTitle: true,
      ),
      body: Obx(
        () => controller.isFetching.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.datakesenian.length,
                itemBuilder: (context, index) {
                  final Kesenian = controller.datakesenian[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          '${baseApiUrl}${controller.datakesenian[index].gambarKesenian}' ??
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
                                  controller.datakesenian[index].nmKesenian ??
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
                                controller.datakesenian[index].deskripsi ?? '',
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
