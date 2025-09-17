import 'package:amrita_gatepass/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../themes/app_colors.dart';

class GatepassController extends GetxController {
  late final WebViewController webViewController;
  late final String visitorId;

  @override
  void onInit() {
    super.onInit();
    final htmlContent =Get.arguments["html_response"];
    visitorId = Get.arguments["visitor_id"];
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..loadHtmlString(htmlContent);
  }


  addVistorLog(type) async {
    try {
      var response = await VenderService().insertVisitorLog({
        "staff_id": "9063",
        "type": type,
        "id": visitorId,
      });
      if (response["success"]) {
        Get.back();
        Get.snackbar(
          "Successfully Logged",
          "IN" == type ? "Visitor In ✅" : "Visitor Out ✅",
          snackPosition: SnackPosition.BOTTOM,
          borderColor: AppColors.primaryColor,
          borderWidth: 1,
          backgroundColor: Colors.white,
          colorText: Colors.black,
          margin: const EdgeInsets.all(8),
          duration: const Duration(seconds: 3),
        );

      } else {
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
    } catch (e) {
       Get.snackbar(
          "Something went wrong",
          "$e",
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