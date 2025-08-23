import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:amrita_gatepass/main.dart';
import 'package:flutter/material.dart';
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

final AadOAuth oauth = AadOAuth(new Config(
    tenant: "organizations",
    clientId: "9a5b1112-36b9-44df-990a-36df4a33c1a5",
    scope: "openid profile offline_access",
    redirectUri:
        "msauth://com.myamrita.studentportal/Kf5iVwblzspMBfM3TkNL2q6YOJs%3D",
    navigatorKey: navigatorKey,
    webUseRedirect: false,
    loader: Center(child: CircularProgressIndicator()),
    postLogoutRedirectUri: 'http://your_base_url/logout',
  ));

}