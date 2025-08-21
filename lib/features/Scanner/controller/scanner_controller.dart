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

  void onQRCodeDetected(String qrData) {
    if (isScanning.value) {
      isScanning.value = false;
      Get.dialog(
        AlertDialog(
          title: const Text('Student Found'),
          content: Text('QR Code Data: $qrData'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                isScanning.value = true; 
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void goBack() {
    Get.back();
  }

  void showMenu() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
