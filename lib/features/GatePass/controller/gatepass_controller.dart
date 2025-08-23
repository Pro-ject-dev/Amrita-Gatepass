import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GatepassController extends GetxController {
  late final WebViewController webViewController;

  @override
  void onInit() {
    super.onInit();
    final htmlContent =Get.arguments["html_response"];
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(htmlContent);
  }
}