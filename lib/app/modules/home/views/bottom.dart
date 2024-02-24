import 'package:bjndiscover/app/modules/bookmark/views/bookmark_view.dart';
import 'package:bjndiscover/app/modules/home/controllers/home_controller.dart';
import 'package:bjndiscover/app/modules/home/views/home_view.dart';
import 'package:bjndiscover/app/modules/panduan/views/panduan_view.dart';
import 'package:bjndiscover/app/modules/tentang/views/tentang_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottom extends GetView<HomeController> {
  var controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TabBarView(
        children: controller.widgetOptions,
        controller: controller.tabController,
        physics: NeverScrollableScrollPhysics(),
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: 'Panduan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Tentang',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Color(0xFF297E69),
            unselectedItemColor: Colors.grey,
            onTap: controller.changeTab,
          )),
    );
  }
}
