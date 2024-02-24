import 'package:bjndiscover/app/modules/home/views/bottom.dart';
import 'package:bjndiscover/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000), () {
      Get.toNamed(Routes.HOME);
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF297E69),
              Color(0xFF297E69),
            ],
            begin: const FractionalOffset(0, 0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Obx(
                () => AnimatedOpacity(
                  opacity: controller.isVisible.value ? 1.0 : 0,
                  duration: Duration(milliseconds: 1200),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'images/border.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Obx(
                () => AnimatedOpacity(
                  opacity: controller.isVisible.value ? 1.0 : 0,
                  duration: Duration(milliseconds: 800),
                  child: Center(
                    child: Container(
                      height: 140.0,
                      width: 140.0,
                      child: ClipOval(
                        child: Image.asset(
                          'images/BJNDiscover.png',
                          width: 10,
                          height: 10,
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 2.0,
                            offset: Offset(5.0, 3.0),
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
