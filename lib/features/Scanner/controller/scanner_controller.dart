import 'package:amrita_gatepass/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerController extends GetxController {
  late MobileScannerController cameraController;
  RxBool isFlashOn = false.obs;
  RxBool isScanning = true.obs;

  @override
  void onInit() {
    super.onInit();
    cameraController = MobileScannerController();
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }

  void toggleFlash() {
    isFlashOn.value = !isFlashOn.value;
    cameraController.toggleTorch();
  }

  void onQRCodeDetected(String qrData) async {
    if (isScanning.value) {
      isScanning.value = false;
      Get.back();
      Get.snackbar(
        "Successfully Scanned",
        "Qr Code Data : $qrData",
        snackPosition: SnackPosition.BOTTOM,
        borderColor: AppColors.primaryColor,
        borderWidth: 1,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        margin: const EdgeInsets.all(8),
        duration: const Duration(seconds: 5),
      );

      print("Qr Code Data: ${qrData} -------------------------------> ");
    }
  }

  void goBack() {
    Get.back();
  }
}
