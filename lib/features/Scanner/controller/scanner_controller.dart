import 'package:amrita_gatepass/routes/app_routes.dart';
import 'package:amrita_gatepass/service.dart';
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
      try {
       final result = await VenderService().getVisitorPass({"id": qrData});
      if (result["success"]) {
        final htmlresponse = result["data"]["html"];
        final visitorId = result["data"]["std_visit_id"];
        Get.offNamed(
          AppRoutes.gatepass,
          arguments: {"html_response": htmlresponse, "visitor_id": visitorId},
        );
        Get.snackbar(
          "Successfully Scanned",
          "Gate Pass Verified ✅",
          snackPosition: SnackPosition.BOTTOM,
          borderColor: AppColors.primaryColor,
          borderWidth: 1,
          backgroundColor: Colors.white,
          colorText: Colors.black,
          margin: const EdgeInsets.all(8),
          duration: const Duration(seconds: 3),
        );
      } else {
        Get.back();
        Get.snackbar(
          "Invalid QR Code",
          "Try Again",
          snackPosition: SnackPosition.BOTTOM,
          borderColor: AppColors.primaryColor,
          borderWidth: 1,
          backgroundColor: Colors.white,
          colorText: Colors.black,
          margin: const EdgeInsets.all(8),
          duration: const Duration(seconds: 3),
        );
      }
      } catch (e) {
      Get.back();
        Get.snackbar(
          "Something went wrong",
          "Try Again",
          snackPosition: SnackPosition.BOTTOM,
          borderColor: AppColors.primaryColor,
          borderWidth: 1,
          backgroundColor: Colors.white,
          colorText: Colors.black,
          margin: const EdgeInsets.all(8),
          duration: const Duration(seconds: 3),
        );
      }
      
    }
  }

  void goBack() {
    Get.back();
  }
}
